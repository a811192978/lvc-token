<template>
<div :class="['container']">

    <div class="head">
        <div class="my flex">
            <img :src="require( '../../assets/homelogo.png')" class="huo" mode />
            <div class="right">
                <div class="align-center">
                    <div class="text">我的算力</div>
                    <img :src="require('../../assets/lv' + level + '.png')" class="lv" mode />
                </div>
                <div class="num alignLeft">{{ power }}</div>

            </div>

        </div>
        <div class="my flex">
            <div class="account">
                <div class="align-center">
                    <div class="text">我的账户</div>
                </div>
                <div class="num alignLeft" style="margin-top:20px;">
                    <span>LVC {{balance}}</span>
                    <span style="margin-left: 50px;"> CCT {{cctbalance}}</span>

                </div>

            </div>

        </div>
    </div>
    <div class="cont">
        <div class="tab space-between">
            <div class="item" @click="h5Copy(myAddress);xxx();">
                <img :src="require('../../assets/1.png')" class="img" mode />
                <div class="text">邀请好友</div>
            </div>
            <div class="item" @click="lvShow = true">
                <img :src="require('../../assets/2.png')" class="img" mode />
                <div class="text">等级说明</div>
            </div>
            <div class="item" @click="getNewUserPower">
                <img :src="require('../../assets/3.png')" class="img" mode />
                <div class="text">新人奖励</div>
            </div>
            <div class="item" @click="bindshow">
                <img :src="require('../../assets/4.png')" class="img" mode />
                <div class="text">绑定邀请人</div>
            </div>

        </div>
        <div class="tab space-between" style="margin-top:30px">
            <div class="item" @click="showBurnFlag = true">
                <img :src="require('../../assets/5.png')" class="img" mode />
                <div class="text">燃烧LVC</div>
            </div>
            <div class="item" @click="kongtou">
                <img :src="require('../../assets/6.png')" class="img" mode />
                <div class="text">空投</div>
            </div>

            <div class="item" @click="showIncome">
                <img :src="require('../../assets/7.png')" class="img" mode />
                <div class="text">领取LVC</div>
            </div>
            <div class="item" @click="showProfitFlagAction">
                <img :src="require('../../assets/8.png')" class="img" mode />
                <div class="text">兑换分红</div>
            </div>

        </div>
    
        <!-- <div class="line" v-if="receiveTimestamp != 0">
            上次领取奖励：{{ receiveTime }}
        </div>
        <div class="line" v-if="receiveTimestamp != 0" style="border-top: none">
            下次领取奖励：{{ nextReceiveTime }}
        </div>
        <div class="my-box airdrop-box" v-if="show_upgrade">
            <div class="top space-between">
                <div class="align-center">
                    <img :src="require('../../assets/' + assetUrl + 'gift.png')" class="img" mode />
                    <div class="text">升级</div>
                </div>
            </div>
            <div class="copy copy1 space-between">
                <div class="flex_v_start flex1">
                    <div class="num">老合约算力</div>
                    <div class="blue_num">{{ this.oldPower }}</div>
                </div>
                <div class="flex-box round" style="background-color: #ff712a; margin-left: 10px" @click="getUpgrade" v-if="show_upgrade">
                    <img :src="require('../../assets/' + assetUrl + 'upgrade.png')" class="upgrade_img" mode />
                    升级
                </div>
            </div>
        </div> -->

        <div class="my-box">
            <div class="top space-between">
                <div class="align-center">
                    <div class="text">分红池剩余总量</div>
                </div>
                <div class="text">{{ profitPool }}</div>
            </div>
            <div class="top space-between">
                <div class="align-center">
                    <div class="text">累计分红数量</div>
                </div>
                <div class="text">{{ profitgetALL }} </div>
            </div>
            <div class="top space-between" style="margin-bottom: 20px;">
                <div class="align-center">
                    <div class="text">有效分红数量</div>
                </div>
                <div class="text"> {{ proofCount }} </div>
            </div>

        </div>
        <div class="my-box">

            <div class="top space-between">
                <div class="align-center">
                    <div class="text">全网通证</div>
                </div>
                <div class="text"> {{ totalSupply }} </div>
            </div>
            <div class="top space-between" style="margin-bottom: 20px;">
                <div class="align-center">
                    <div class="text">全网算力</div>
                </div>
                <div class="text"> {{ totalPower }} </div>
            </div>

        </div>
        <div class="my-box">
            <div class="top space-between">
                <div class="align-center">
                    <div class="text">累计邀请人数</div>
                </div>
                <div class="text"> {{ inviteCount }} </div>
            </div>
            <div class="top space-between" style="margin-bottom: 20px;">
                <div class="align-center">
                    <div class="text">累计邀请算力</div>
                </div>
                <div class="text"> {{ inviteProfitSum }} </div>
            </div>

        </div>
        <div class="my-box">

            <div class="top space-between">
                <div class="align-center">
                    <div class="text">LVC合约地址</div>
                </div>
                <div class="text"> </div>
            </div>
            <div class="top space-between" style="margin-bottom: 20px;">
                <div class="align-center">
                    <div class="text" style="font-size: 12px;">{{contractAddress}}</div>
                </div>
                <div class="text">
                    <img src="../../assets/copy.png" class="copy" @click="h5Copy(contractAddress)" mode />
                </div>
            </div>
        </div>

    </div>
    <div class="bg" v-show="lvShow">
        <div class="flex-box">
            <div class="box" style="padding-top:10px;padding-left:20px;height:auto;padding-right:10px;">
                <!-- <div class="align-center">
                    <img :src="require('../../assets/' + assetUrl + 'wenhao.png')" class="wenhao" mode />
                    <div class="text">等级说明</div>
                </div> -->
                <div class="text1 alignLeft">
                    <!-- <span class="tit">转账手续费销毁功能</span> -->
                    <br />
                    <img :src="require('../../assets/desc.png')" width="290"   mode />

                </div>
                <div class="flex-box btn" @click="lvShow = false">好的</div>
            </div>
        </div>
    </div>
    <!-- 燃烧原料 -->
    <div class="bg" v-show="showProfitFlag">
        <div class="flex-box">

            <div class="box1">
                <div class="tab">
                    <a :class="`text1 ${isBuyProof == 0 ? 'active' : ''}`" @click="isBuyProof=0">购买分红证明</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a :class="`text1 ${isBuyProof ==1 ? 'active' : ''}`" @click="isBuyProof=1">领取分红</a>
                    <a :class="`text1 ${isBuyProof ==2 ? 'active' : ''}`" @click="isBuyProof=2">贡献分红</a>

                </div>
                <template v-if="isBuyProof==0">
                    <div class="align-center">
                        <img :src="require('../../assets/' + assetUrl + 'rs.png')" class="rs" mode />
                        <div class="text">购买分红证明</div>
                    </div>
                    <div>
                        我的分红证明数量：{{proof}}
                    </div>
                    <div class="text1 alignLeft">
                        可用余额
                        <span>{{ balance }}</span>LVC
                    </div>

                    <div class="tit alignLeft">
                        * 价格{{profitPrice}}LVC
                    </div>
                </template>

                <template v-if="isBuyProof ==1">
                    <div class="align-center">
                        <img :src="require('../../assets/' + assetUrl + 'rs.png')" class="rs" mode />
                        <div class="text">领取分红</div>
                    </div>
                    <div>
                        总分红证明数量：{{proofCount}}
                    </div>
                    <div>
                        我的分红证明数量：{{proof}}
                    </div>
                    <div class="text1 alignLeft">
                        领取状态： {{proofStatus ? '可以领取' : '等待领取'}}

                    </div>
                    <div class="text1 alignLeft">
                        您的分红证明： {{proof == 0  ? '您还未购买分红证明' : '您已经购买分红证明'}}

                    </div>

                </template>
                <template v-if="isBuyProof==2">
                    <div class="align-center">
                        <img :src="require('../../assets/' + assetUrl + 'rs.png')" class="rs" mode />
                        <div class="text">贡献分红</div>
                    </div>
                    <div class="text1 alignLeft">
                        可用余额
                        <span>{{ cctbalance }}</span>CCT
                    </div>
                    <div class="input-box space-between">
                        <input type="text" class="input" placeholder="贡献金额" v-model="gongxianAmount" />

                    </div>
                </template>
                <div class="flex-box btn" @click="profitAction">确定</div>
                <div class="text4" @click="showProfitFlag = false">取消</div>
            </div>
        </div>
    </div>
    <!-- 燃烧原料 -->
    <div class="bg" v-show="showBurnFlag">
        <div class="flex-box">
            <div class="box1">
                <div class="align-center">
                    <img :src="require('../../assets/' + assetUrl + 'rs.png')" class="rs" mode />
                    <div class="text">燃烧原料</div>
                </div>
                <div class="text1 alignLeft">
                    可用余额
                    <span>{{ balance }}</span>LVC
                </div>
                <div class="input-box space-between">
                    <input type="text" class="input" value placeholder="输入燃烧数量" v-model="amount" />
                    <div class="align-center">
                        <div class="text2">LVC</div>
                        <div class="line"></div>
                        <div class="text3" @click="inputAll">全部</div>
                    </div>
                </div>
                <div class="tit alignLeft">
                    * 确定提交后你燃烧的余额将销毁变成3倍算力
                </div>
                <div class="flex-box btn" @click="burn">确定燃烧</div>
                <div class="text4" @click="showBurnFlag = false">取消</div>
            </div>
        </div>
    </div>
    <!-- 绑定邀请人 -->
    <div class="bg" v-show="bindFlag">
        <div class="flex-box">
            <div class="box1">
                <div class="align-center">
                    <img :src="require('../../assets/' + assetUrl + 'rs.png')" class="rs" mode />
                    <div class="text">绑定邀请人</div>
                </div>

                <div class="input-box space-between" v-if="inviteAddress== ''">
                    <input type="text" class="input" placeholder="输入邀请人地址" v-model="inviteAddressInput" />

                </div>
                <div class="input-box space-between" v-if="inviteAddress != ''">
                    已经绑定： {{inviteAddress}}

                </div>
                <div class="flex-box btn" v-if="inviteAddress== ''" @click="registration">确定</div>
                <div class="flex-box btn" v-if="inviteAddress != ''" @click="bindFlag = false">关闭</div>

                <div class="text4" @click="bindFlag = false">取消</div>
            </div>
        </div>
    </div>
    <!-- 空投 -->
    <div class="bg" v-show="kongtouFlag">
        <div class="flex-box">
            <div class="box1">
                <div class="align-center">
                    <img :src="require('../../assets/' + assetUrl + 'rs.png')" class="rs" mode />
                    <div class="text">空投(价格1CCT)</div>
                </div>

                <div class="input-box space-between">
                    <input type="text" class="input" placeholder="输入数量" v-model="buyamount" />

                </div>

                <div class="flex-box btn" @click="handleBuy">确定</div>
                <div class="text4" @click="kongtouFlag = false">取消</div>
            </div>
        </div>
    </div>
    <!-- 挖取矿产 -->
    <div class="bg" v-show="bgShow">
        <div class="flex-box">
            <div class="box1">
                <div class="align-center">
                    <img :src="require('../../assets/' + assetUrl + 'wq.png')" class="wq" mode />
                    <div class="text">挖取矿产</div>
                </div>
                <div class="text5">
                    <span>152152.311</span>
                    <br />待更新通证算力
                </div>
                <div class="tit tit1">我当前通证算力总量：{{ power }}</div>
                <div class="flex-box btn">增加更新</div>
                <div class="text4" @click="bgShow = false">取消</div>
            </div>
        </div>
    </div>
    <!-- 领取收益弹框 -->
    <div class="bg" v-show="incomeFlag">
        <div class="flex-box">
            <div class="box1">
                <div class="align-center">
                    <img :src="require('../../assets/' + assetUrl + 'lqjl.png')" class="lq" mode />
                    <div class="text">领取收益</div>
                </div>
                <div class="text5" v-if="receiveAble">
                    <span class="">预估消耗: {{ cctAmount }}CCT</span>

                </div>
                <div class="text5" v-if="receiveAble">
                    <span class="hugeMainTxt">{{ expectAmount }}</span>
                    <br />LVC
                </div>

                <div class="time-box" v-else>
                    <div class="time" v-for="(item, index) in hour" :key="'1_' + index">
                        {{ item }}
                    </div>

                    <div class="bi">:</div>
                    <div class="time" v-for="(item, index) in minutes" :key="'2_' + index">
                        {{ item }}
                    </div>
                    <div class="bi">:</div>
                    <div class="time" v-for="(item, index) in seconds" :key="'3_' + index">
                        {{ item }}
                    </div>
                </div>
                <div class="last-time" v-if="!receiveAble">
                    上次领取奖励：{{ receiveTime }}

                </div>
                <div class="tit tit1">* 如果没有授权过CCT第一步为授权操作CCT。第二步为挖矿。中间会间隔20秒左右。请耐心等待</div>
                <div class="tit tit1 tit2">* 等级达到Lv1-Lv4,产出收益最多累计3次</div>
                <div :class="['flex-box', receiveAble ? 'btn' : 'btn-disable']" @click="getReceiveIncome">
                    {{ receiveAble ? "确定领取" : "明日再来" }}
                </div>
                <div class="text4" @click="incomeFlag = false">取消</div>
            </div>
        </div>
    </div>

</div>
<!-- </div>
  </div> -->
</template>

<script>
// import h5Copy from '../js_sdk/junyi-h5-copy/junyi-h5-copy/junyi-h5-copy.js'
// import MiniRefreshTools from 'minirefresh';
// import 'minirefresh/dist/debug/minirefresh.css'
import {
    h5Copy,
    initEth,
    timeUtils,
    vertify,
    Decimal
} from "@/utils/utils";
import {
    ethers
} from "ethers";
import {
    abi
} from "./abi";
import {
    Toast
} from "vant";
import {
    GLOBAL_CONFIGS
} from "../../utils/global";
export default {
    data() {
        return {
            profitPrice: '',
            bindFlag: false,
            gongyiamount: '',
            profitPool: 0,
            cctbalance: 0,
            isBuyProof: 0,
            proofStatus: false,
            proof: 0,
            proofCount: 0,
            cctContractAddress: GLOBAL_CONFIGS.cctContractAdress,
            contractAddress: GLOBAL_CONFIGS.contractAdress, // 合约地址
            oldContractAddress: "0x3FB708e854041673433e708feDb9a1b43905b6f7", // 老合约地址，用于查询power
            contract: null, // 当前的合约对象
            cctcontract: null,
            myAddress: "", // 我的地址
            balance: "0.00", // 我的余额
            totalPower: "0", // 全网通证总量
            totalSupply: "0", // 全网通证总量
            power: "0", // 我的算力
            level: 0,
            showProfitFlag: false,
            lvShow: false,
            bgShow: false,
            pledgeShow: false,
            buyamount: '',
            pledgeOutShow: false,
            type: 1,
            kongtouFlag: false,
            epoch: 86400, // 挖矿周期
            inviteCount: "0", // 邀请的人数
            receiveTimestamp: 0, // 上次领取奖励的时间戳
            receiveTime: "", // 上次领取奖励的时间
            nextReceiveTime: "", // 下次领取奖励的时间
            inviteAddress: "", // 已绑定邀请人地址
            inviteAddressInput: "", // 输入邀请人的地址
            rewardCount: 0, // 获取累计收益
            incomeFlag: false, // 领取收益弹框
            deadline: "", // 截止日期
            hour: "00", // 时
            minutes: "00", // 分
            seconds: "00", // 秒
            cctAmount: '',
            showBurnFlag: false, // 燃烧算力弹框
            receiveAble: false, // 收益是否可以被领取
            amount: "", // 燃烧数量
            expectAmount: 0, // 预估收益
            decimals: 3, //精度
            config: GLOBAL_CONFIGS,
            assetUrl: process.env.VUE_APP_PLATFORM == "QKI" ? "" : "heco/",
            is_upgrade: false, // 是否可以升级
            show_upgrade: false,
            oldPower: 0,
            minirefresh: null,
            minUsdt: 0,
            inviteProfitSum: 0,
            usdtDecimals: 6,
            usdtSymbol: "",
            profitgetALL: 0,
            pledgeUsdtAmount: 0, // 质押usdt的数量
            usdtContractAddress: GLOBAL_CONFIGS.usdtContractAdress,
            usdtBalanceOf: 0,
            totalUsdtAmount: 0,
            min_gasprice: 5,
            profitCurrentPool: 0,
            gongxianAmount: ''
        };
    },
    created() {
      
        this.init()
    },
    mixins: [h5Copy, initEth, timeUtils, vertify, Decimal],
    methods: {
        xxx() {
               
        },
        async refrs() {
            this.getinviteCount();
            this.getReceiveTime();
            this.getRewardCount();
            this.getInviteAddress();
            this.getBalance();
            this.getProfit();
            await this.getPower();

        },
        profitAction() {

            if (this.isBuyProof == 0) {
                this.buyProff();
            }
            if (this.isBuyProof == 1) {
                this.receiveProfit();
            }
            if (this.isBuyProof == 2) {
                this.handleGongyi();
            }

        },

        kongtou() {
            this.buyamount = '';
            this.kongtouFlag = true;

        },
        bindshow() {
            this.bindFlag = true;
            if (this.inviteAddress != '') {
                return this.inviteAddressInput = this.inviteAddres;
            }
            this.inviteAddressInput = '';
        },
      
        async buyProff() {
            const that = this;
            await this.getPower();
            await that.getBalance();
            if (that.balance < this.profitPrice) {
                return Toast('余额不足');
            }

            let [error1, _proof] = await this.to(that.contract.proof(that.myAddress));
            if (error1) {
                return Toast('获取分红证明失败')
            }
            that.proof = _proof;

            if (this.level < 3) {
                return Toast('级别小于3级不能购买！')
            }
            if (this.level == 3) {
                if (that.proof >= 2) {
                    return Toast('3级最多智能购买2个！')
                }
            }

            if (this.level == 4) {
                if (that.proof >= 4) {
                    return Toast('4级最多智能购买4个！')
                }
            }
            let [error, res] = await this.to(
                that.contract.getProfitProof({
                    gasLimit: 1000000,
                    gasPrice: ethers.utils.parseUnits(
                        String(that.min_gasprice),
                        "gwei"
                    ),
                })
            );
            if (error) {
                return Toast('购买失败!')
            }
            if (this.doResponse(error, res)) {
                Toast("提交请求成功，等待区块确认");
                await this.queryTransation(res.hash);
            }
            //return status
        },
        async receiveProfit() {
            const that = this;
            if (!that.proofStatus) {
                return Toast('领取状态为不可以领取');
            }
            let [error1, _proof] = await this.to(that.contract.proof(that.myAddress));
            if (error1) {
                return Toast('获取分红证明失败')
            }

            this.proof = _proof;
            if (that.proof == 0) {
                return Toast('您没有购买分红证明');
            }
            let [error, res] = await this.to(
                that.contract.getProfit({
                    gasLimit: 1000000,
                    gasPrice: ethers.utils.parseUnits(
                        String(that.min_gasprice),
                        "gwei"
                    ),
                })
            );
            if (error) {
                return Toast('购买失败!')
            }
            if (this.doResponse(error, res)) {
                Toast("提交请求成功，等待区块确认");
                await this.queryTransation(res.hash);
            }
        },

        async showProfitFlagAction() {
            const that = this;
            that.proof = 0;
            this.proofStatus = false;
            this.gongxianAmount = '';
            this.showProfitFlag = true;
            this.getProfit();
            this.getBalance();

        },
        async getProfit() {
            const that = this;
            let [error, _proofStatus] = await this.to(that.contract.proofStatus());
            if (error) {
                return Toast('获取分红状态失败')
            }
            that.proofStatus = _proofStatus;
            let [error1, _proof] = await this.to(that.contract.proof(that.myAddress));
            if (error1) {
                return Toast('获取分红证明失败')
            }
            that.proof = _proof;
            let [error2, _profitCurrentPool] = await this.to(that.contract.profitCurrentPool());
            if (error2) {
                return Toast('获取分红余额失败')
            }

            that.profitCurrentPool = _profitCurrentPool;

            let [error3, _profitgetALL] = await this.to(that.contract.profitgetALL());
            if (error3) {
                return Toast('获取累计分红失败')
            }
            that.doResponse(error3, _profitgetALL, "profitgetALL", 8);

            let [error4, _profitPool] = await this.to(that.contract.profitPool());
            if (error4) {
                return Toast('获取累计分红失败')
            }

            that.doResponse(error4, _profitPool, "profitPool", 8);

        },
        show(num) {
            this.type = num;
            this.bgShow = true;
        },
        async init() {
            const that = this;
            if (this.signer == null) {
                return;
            }
            var contract = new ethers.Contract(
                this.contractAddress,
                abi,
                this.signer
            );
            this.contract = contract;
            this.cctcontract = new ethers.Contract(
                this.cctContractAddress,
                abi,
                this.signer
            );
           
            await this.getDecimals();
            await this.getEpoch();
            this.getTotalSupply();
            this.getinviteCount();
            this.getReceiveTime();
            this.getRewardCount();
            this.getInviteAddress();
            this.getBalance();
            this.getProfit();
            await this.getPower();

            await this.initContract();
            setInterval(() => {
                that.refrs();
            }, 10000);

        },
        // 获取合约初始化数据，以后都不会更新的方法，只请求一次
        async initContract() {
            // 获取token2
            let [error2, token2] = await this.to(this.contract.requireToken());
            if (this.doResponse(error2, token2)) {
                const token2Contract = new ethers.Contract(token2, abi, this.signer);
                // let [error2_2, token2Decimals] = await this.to(
                //   token2Contract.decimals()
                // );
                // if (this.doResponse(error2_2, token2Decimals)) {
                //   this.usdtDecimals = token2Decimals;
                // }
                let [error2_3, token2Symbol] = await this.to(token2Contract.symbol());
                if (this.doResponse(error2_3, token2Symbol)) {
                    this.usdtSymbol = token2Symbol;
                }
                let [error2_4, token2Min] = await this.to(this.contract.anti_bot());
                this.doResponse(error2_4, token2Min, "minUsdt", this.usdtDecimals);

                let [error, usdtBalance] = await this.to(
                    token2Contract.balanceOf(this.contractAddress)
                );
                this.doResponse(
                    error,
                    usdtBalance,
                    "totalUsdtAmount",
                    this.usdtDecimals
                );
            }

            // 获取是否可以进行挖矿
            let [error3, res1] = await this.to(this.contract.is_mint());
            if (this.doResponse(error3, res1)) {
                this.is_mint = res1;
            }
        },
        // 展示领取收益
        async showIncome() {
            // 新用户且算力不为0，进入页面就可以领取一次收益
            if (this.receiveTimestamp == 0) {
                if (this.power != 0) {
                    this.receiveAble = true;
                    this.incomeFlag = true;
                    // 默认领取一天的收益，传入参数只要是小于epoch的任何一个数都可以
                    this.calcExpectAmount(10);
                } else {
                    Toast("您当前还没有算力！");
                    return;
                }
            } else {
                this.incomeFlag = true;
                let nowTimeStr = Date.now().toString().substring(0, 10);
                let distance = this.receiveTimestamp + this.epoch - Number(nowTimeStr);
                // 如果distance大于0表示收益还不可以领取。需要计算倒计时
                if (distance <= 0) {
                    this.calcExpectAmount(distance);
                }
            }
        },
        // async getAddress() {
        //   let [error, address] = await this.to(this.signer.getAddress());
        //   if (error == null) {
        //     this.myAddress = address;
        //   } else {
        //     console.log(error);
        //   }
        // },

        async getQkiBalance() {
            let [error, balance] = await this.to(
                this.provider.getBalance(this.myAddress)
            );
            if (error == null) {
                let etherString = ethers.utils.formatEther(balance);
                return parseFloat(etherString);
            }
            return 0.0;
        },
        // 得到余额
        async getBalance() {
            let [error, balance] = await this.to(
                this.contract.balanceOf(this.myAddress)
            );
            this.doResponse(error, balance, "balance", this.decimals);
            let [error1, cctbalance] = await this.to(
                this.cctcontract.balanceOf(this.myAddress)
            );
            this.doResponse(error1, cctbalance, "cctbalance", 8);
            let [error2, proofCount] = await this.to(
                this.contract.proofCount()
            );
            this.doResponse(error2, proofCount, "proofCount", 0);
            let [error3, inviteProfitSum] = await this.to(
                this.contract.inviteProfitSum(this.myAddress)
            );
            this.doResponse(error3, inviteProfitSum, "inviteProfitSum", 3);
            let [error4, profitPrice] = await this.to(
                this.contract.profitPrice()
            );
            this.doResponse(error4, profitPrice, "profitPrice", 3);

        },
        // 得到通证总量
        async getTotalSupply() {
            let [error, res] = await this.to(this.contract.totalSupply());
            this.doResponse(error, res, "totalSupply", this.decimals);
            let [error1, ress] = await this.to(this.contract.totalPower());
            console.log(ress.toNumber(), 'total power')
            this.doResponse(error1, ress, "totalPower", 3);

        },
        // 得到精度
        async getDecimals() {
            let [error, res] = await this.to(this.contract.decimals());
            this.doResponse(error, res, "decimals");
        },
        // 得到个人算力
        async getPower() {
            let [error, res] = await this.to(this.contract.power(this.myAddress));
            this.doResponse(error, res, "power", this.decimals);
        },
        // 从老合约上获取算力
        async getOldPower() {
            let contract = new ethers.Contract(
                this.oldContractAddress,
                abi,
                this.signer
            );
            let [error, res] = await this.to(contract.power(this.myAddress));
            this.doResponse(error, res, "oldPower", this.decimals);
            if (this.oldPower <= 0) {
                this.show_upgrade = false;
            } else {
                this.show_upgrade = true;
            }
        },
        // 获取累计收益
        async getRewardCount() {
            let [error, res] = await this.to(
                this.contract.rewardCount(this.myAddress)
            );
            this.doResponse(error, res, "rewardCount", this.decimals);
        },
        // 获取上次领取奖励的时间
        // 注：这个方法必须调用在getEpoch方法之后，因为他们两个共同影响倒计时的逻辑
        async getReceiveTime() {
            let [error, res] = await this.to(
                this.contract.last_miner(this.myAddress)
            );
            this.doResponse(error, res, "receiveTimestamp");
        },
        // 获取挖矿周期
        async getEpoch() {
            let [error, res] = await this.to(this.contract.epoch());
            this.doResponse(error, res, "epoch");
        },
        // 获取邀请人数
        async getinviteCount() {
            let [error, res] = await this.to(
                this.contract.inviteCount(this.myAddress)
            );
            this.doResponse(error, res, "inviteCount");
        },
        // 获取绑定人信息
        async getInviteAddress() {
            let [error, res] = await this.to(this.contract.invite(this.myAddress));
            if (this.doResponse(error, res)) {
                if (res == "0x0000000000000000000000000000000000000000") {
                    res = "";
                }
                this.inviteAddress = res;
            }
        },
        //领取新人
        async getNewUserPower() {

            let [error1, isnew] = await this.to(
                this.contract.isNewUser(this.myAddress)
            );
            if (error1) {
                console.log(error1)
                return Toast("发生错误");
            }

            if (isnew) {
                return Toast("已经领取过！");
            }
            let [error, res] = await this.to(
                this.contract.getNewUserPower({
                    gasLimit: 1000000,
                    value: '10000000000000000',
                    gasPrice: ethers.utils.parseUnits("5", "gwei"),
                })
            );
            if (error) {
                console.log(error, 'fuck');
                return Toast("发生错误");
            }
            if (this.doResponse(error, res)) {
                Toast("领取成功");
            }
        },
        // 质押
        async handleBuy() {
            const that = this;
            if (this.buyamount == "") {
                return Toast("请输入您的申购数量");

            }
            if (this.buyamount % 1 != 0) {
                return Toast("申购数量必须为整数");
            }

            let [erro2, realBuy] = await this.to(
                this.contract.realBuy()
            );
            if (erro2) {
                return Toast("获取购买历史失败");
            }
            if (realBuy.gt(1000000)) {
                return Toast("申购总数量不能超过1000000个");
            }
            let [erro3, realByAddress] = await this.to(
                this.contract.realByAddress(this.myAddress)
            );
            if (erro3) {
                return Toast("获取购买历史金额失败");
            }
            console.log(realByAddress.toNumber(), 'realByAddress');
            if (realByAddress.add(this.buyamount).gt('10000')) {
                return Toast("单个地址最多空投10000个");
            }
            let cctcontract = new ethers.Contract(this.cctContractAddress, abi, this.signer);
            let [erro1, Token1balance] = await this.to(
                cctcontract.balanceOf(that.myAddress)
            );
            if (erro1) {
                return Toast('获取CCT余额度失败')
            }
            let amount = ethers.utils.parseUnits(this.buyamount.toString(), 0);
            if (Token1balance.div('100000000').lt(this.buyamount.toString())) {
                Toast("CCT金额不足");
                return;
            }
            let [err2, allowce] = await this.to(
                cctcontract.allowance(this.myAddress, this.contractAddress)
            );
            let response = [false];

            if (this.doResponse(err2, allowce)) {
                const hex = ethers.utils.hexValue(allowce);
                const Value = Decimal.div(
                    this.hex2int(hex),
                    ethers.BigNumber.from(10).pow(8)
                );

                if (!(Decimal.sub(Value, amount) >= 0)) {
                    const gasLimit1 = await this.getEstimateGas(() =>
                        cctcontract.estimateGas.approve(that.contractAddress, amount, {
                            gasPrice: ethers.utils.parseUnits(String(this.min_gasprice), "gwei"),
                        })
                    );
                    if (gasLimit1 === 0) {
                        return;
                    }
                    response = await this.to(
                        cctcontract.approve(
                            this.contractAddress,
                            "1000000000000000000000000000000000000000000000000000000000000000000000000000", {
                                gasLimit: Number(gasLimit1),
                                gasPrice: ethers.utils.parseUnits(
                                    String(this.min_gasprice),
                                    "gwei"
                                ),
                            }
                        )
                    );
                }
            }
            let [err, hash] = response;
            if (err == null) {
                Toast("权限申请中...");
                this.pledgeShow = false;
                await this.queryTransation(hash.hash, null, async () => {
                    setTimeout(async () => {
                        let [error, res] = await that.to(
                            that.contract.buyToken(amount, {
                                gasLimit: 1000000,
                                // value: '10000000000000000',
                                gasPrice: ethers.utils.parseUnits(
                                    String(that.min_gasprice),
                                    "gwei"
                                ),
                            })
                        );
                        if (that.doResponse(error, res)) {
                            Toast("提交请求成功，等待区块确认");
                            await that.queryTransation(res.hash);
                        }
                    }, 20000)

                });
            } else {
                Toast("空投中...");

                let [error, res] = await this.to(
                    this.contract.buyToken(amount, {
                        gasLimit: 1000000,
                        gasPrice: ethers.utils.parseUnits(
                            String(this.min_gasprice),
                            "gwei"
                        ),
                    })
                );
                if (this.doResponse(error, res)) {
                    Toast("提交请求成功，等待区块确认");
                    await this.queryTransation(res.hash);
                }
            }
        },
        // 质押
        async handleGongyi() {
            const that = this;
            if (this.gongxianAmount == "") {
                return Toast("请输入您的贡献数量");

            }

            let cctcontract = new ethers.Contract(this.cctContractAddress, abi, this.signer);
            let [erro1, Token1balance] = await this.to(
                cctcontract.balanceOf(that.myAddress)
            );
            if (erro1) {
                return Toast('获取CCT余额度失败')
            }
            let amount = ethers.utils.parseUnits(this.gongxianAmount.toString(), 8);
            if (Token1balance.div('100000000').lt(this.gongxianAmount.toString())) {
                Toast("CCT金额不足");
                return;
            }
            let [err2, allowce] = await this.to(
                cctcontract.allowance(this.myAddress, this.contractAddress)
            );
            let response = [false];

            if (this.doResponse(err2, allowce)) {
                const hex = ethers.utils.hexValue(allowce);
                const Value = Decimal.div(
                    this.hex2int(hex),
                    ethers.BigNumber.from(10).pow(8)
                );

                if (!(Decimal.sub(Value, amount) >= 0)) {
                    const gasLimit1 = await this.getEstimateGas(() =>
                        cctcontract.estimateGas.approve(that.contractAddress, amount, {
                            gasPrice: ethers.utils.parseUnits(String(this.min_gasprice), "gwei"),
                        })
                    );
                    if (gasLimit1 === 0) {
                        return;
                    }
                    response = await this.to(
                        cctcontract.approve(
                            this.contractAddress,
                            "1000000000000000000000000000000000000000000000000000000000000000000000000000", {
                                gasLimit: Number(gasLimit1),
                                gasPrice: ethers.utils.parseUnits(
                                    String(this.min_gasprice),
                                    "gwei"
                                ),
                            }
                        )
                    );
                }
            }
            let [err, hash] = response;
            if (err == null) {
                Toast("权限申请中...");
                this.pledgeShow = false;
                await this.queryTransation(hash.hash, null, async () => {
                    setTimeout(async () => {
                        let [error, res] = await that.to(
                            that.contract.gongyi(amount, {
                                gasLimit: '1000000',
                                // value: '10000000000000000',
                                gasPrice: ethers.utils.parseUnits(
                                    String(that.min_gasprice),
                                    "gwei"
                                ),
                            })
                        );
                        if (that.doResponse(error, res)) {
                            Toast("提交请求成功，等待区块确认");
                            await that.queryTransation(res.hash);
                        }
                    }, 20000)

                });
            } else {
                Toast("公益进行中...");

                let [error, res] = await this.to(
                    this.contract.gongyi(amount, {
                        gasLimit: 1000000,
                        gasPrice: ethers.utils.parseUnits(
                            String(this.min_gasprice),
                            "gwei"
                        ),
                    })
                );
                if (this.doResponse(error, res)) {
                    Toast("提交请求成功，等待区块确认");
                    await this.queryTransation(res.hash);
                }
            }
        },
        // 绑定邀请人。
        async registration() {
            if (this.inviteAddressInput == "") {
                Toast("请输入绑定邀请的地址");
                return;
            }
            if (
                this.inviteAddressInput.toLowerCase() == this.myAddress.toLowerCase()
            ) {
                Toast("不能绑定自己！");
                this.inviteAddressInput = "";
                return;
            }
            if (
                this.inviteAddressInput.toLowerCase() ==
                this.contractAddress.toLowerCase()
            ) {
                Toast("不能绑定合约地址为邀请人！");
                this.inviteAddressInput = "";
                return;
            }
            let [error1, isnew] = await this.to(
                this.contract.power(this.myAddress)
            );
            if(error1) {
                return Toast('获取新人奖励领取状态失败');
            }
            console.log(isnew.toString())
            if(isnew.lt('120000')) {
                return Toast('算力超过或等于120才能绑定邀请!');
            }
            // TODO: 如何验证地址的合法性？？
            let [error, res] = await this.to(
                this.contract.registration(this.inviteAddressInput, {
                    gasPrice: ethers.utils.parseUnits("5", "gwei"),
                })
            );
            if (this.doResponse(error, res)) {
                Toast("绑定成功");
                this.inviteAddress = this.inviteAddressInput;
            }
        },
        // 燃烧
        async burn() {
            if (this.amount == "") {
                Toast("请输入您的燃烧数量");
                return;
            }
            let burn_amount =
                ethers.FixedNumber.from(this.amount.toString()) * 10 ** this.decimals;
            const gasLimit = await this.getEstimateGas(() =>
                this.contract.estimateGas.burn(burn_amount, {
                    value: '10000000000000000',
                    gasPrice: ethers.utils.parseUnits("5", "gwei")
                })
            );
            if (gasLimit === 0) {
                return;
            }
            let [error, res] = await this.to(
                this.contract.burn(burn_amount, {
                    value: '10000000000000000',
                    gasLimit,
                    gasPrice: ethers.utils.parseUnits("5", "gwei"),
                })
            );
            if (this.doResponse(error, res)) {
                this.showBurnFlag = false;
                Toast("操作成功");
                await this.queryTransation(res.hash);
            }
        },
        // 领取挖矿收益
        async getReceiveIncome() {
            const that = this;

            if (!this.receiveAble) {
                Toast("您今天已经领取过收益了,明天再来！");
                return;
            }
            let contract = new ethers.Contract(this.cctContractAddress, abi, this.signer);
            //   let [err112, allowce1] = await this.to(
            //     contract.allowance('0x791953b09F9cd8DE87CC8C7F0E0Cf888c3E7D831', this.contract.address)
            // );
            // console.log(err112,allowce1,'allowce1')

            let [err3, balance] = await this.to(
                contract.balanceOf(this.myAddress)
            );
            if (err3) {
                return Toast('获取CCT余额失败');
            }
            if (balance.lt(this.accMul(this.cctAmount, 100000000))) {
                return Toast('CCT 余额不足');
            }
            let [err2, allowce] = await this.to(
                contract.allowance(this.myAddress, this.contract.address)
            );
            let response = [false];

            if (this.doResponse(err2, allowce)) {
                const hex = ethers.utils.hexValue(allowce);
                const Value = Decimal.div(
                    this.hex2int(hex),
                    ethers.BigNumber.from(10).pow(8)
                );

                if (!(Decimal.sub(Value, Decimal.mul(that.cctAmount, 100000000)) >= 0)) {

                    response = await this.to(
                        contract.approve(
                            this.contract.address,
                            "1000000000000000000000000000000000000000000000000000000000000000000000000000", {
                                gasLimit: '500000',
                                gasPrice: ethers.utils.parseUnits(
                                    String(this.min_gasprice),
                                    "gwei"
                                ),
                            }
                        )
                    );
                    console.log(response,'response');
                    if(response[0] && response[0].code > 0) {
                        return Toast('授权失败，或者拒绝授权。请允许授权')
                    }
                }
            }
            let [err] = response;
            if (err == null) {
                Toast('领取中。。。请耐心等待');
                setTimeout(async function () {

                    let [error, res] = await that.to(
                        that.contract.mint({
                            value: '20000000000000000',
                            gasLimit: '500000',
                            gasPrice: ethers.utils.parseUnits("5", "gwei"),
                        })
                    );
                    if (that.doResponse(error, res, "")) {
                        that.incomeFlag = false;
                        Toast("收益领取成功！");
                        await that.queryTransation(res.hash, true);
                    }
                }, 20000);
            } else {
               
                Toast('领取中。。。');

                let [error, res] = await this.to(
                    this.contract.mint({
                        value: '20000000000000000',
                        gasLimit: '500000',
                        gasPrice: ethers.utils.parseUnits("5", "gwei"),
                    })
                );
                if (this.doResponse(error, res, "")) {
                    this.incomeFlag = false;
                    Toast("收益领取成功！");
                    await this.queryTransation(res.hash, true);
                }

            }
        },
        // 是否可以升级
        async getIsUpgrade() {
            let [error, res] = await this.to(this.contract.is_upgrade());
            if (this.doResponse(error, res)) {
                this.is_upgrade = res;
            }
        },
        // 升级
        async getUpgrade() {
            if (!this.is_upgrade) {
                Toast("现在还不能升级");
                return;
            }
            if (this.power != 0) {
                Toast("算力为0才可以升级！");
                return;
            }
            const gasLimit = await this.getEstimateGas(() =>
                this.contract.estimateGas.upgrade({
                    gasPrice: ethers.utils.parseUnits(String(this.min_gasprice), "gwei"),
                })
            );
            if (gasLimit === 0) {
                return;
            }
            let [error, res] = await this.to(
                this.contract.upgrade({
                    gasLimit,
                    gasPrice: ethers.utils.parseUnits(String(this.min_gasprice), "gwei"),
                })
            );
            if (this.doResponse(error, res, "")) {
                Toast("升级成功！");
                await this.queryTransation(res.hash);
            }
        },
        openPledgeOut() {
            let nowTimeStr = Date.now().toString().substring(0, 10);
            // 如果distance大于0表示收益还不可以领取。需要计算倒计时
            let distance = this.receiveTimestamp + 86400 - Number(nowTimeStr);
            if (distance <= 0) {
                this.pledgeOutShow = true;
            } else {
                Toast("取出质押需要在上次挖矿后24小时!");
            }
        },

        // 查询Transaction
        async queryTransation(hash, updateTime, callback) {
            const that = this;
            await this.provider.waitForTransaction(hash).then(async (receipt) => {
                Toast("区块打包成功", receipt);
                if (callback) {
                    callback();
                } else {
                    setTimeout(async () => {
                        await that.getBalance();
                        await that.getPower();
                        await that.getTotalSupply();
                        // that.getPledgeAmount();
                        that.getProfit();

                        that.amount = "";
                        if (updateTime) {
                            await that.getRewardCount();
                            await that.getEpoch();
                            await that.getReceiveTime();
                        }
                    }, 20000);

                }
            });
        },
        async calcExpectAmount(distance) {
            // 计算阶段奖励
            let currRate = "0.001";
            const rates = ["0.001", "0.001", "0.002", "0.003", "0.004"]
            const lvcrates = ["0.2", "0.16", "0.12", "0.1", "0.1"]

            currRate = rates[this.level];
            const lvcrate = lvcrates[this.level]
            // 奖励是否过期
            let day = Math.floor(Math.abs(distance) / this.epoch);
            day = day + 1;
            // let expectAmount = this.accMul(this.power, currRate);
            if (this.timestampToTime == 0) {
                day = 1;
            } else {
                if (this.level == 1) {
                    if (day > 1) {
                        day = 1;
                    }
                } else {
                    if (day > 3) {
                        day = 3;
                    }
                }
            }

            // let par1 =
            this.expectAmount = this.accMul(this.accMul(this.power, currRate), day) - this.accMul(this.accMul(this.accMul(this.power, currRate), day), lvcrate);
            this.calcExpectCctAmount(this.power, this.level, day)
        },
        calcExpectCctAmount(amount, lv, day) {
            const RATE = ["0.01", "0.01", "0.02", "0.03", "0.04"]
            const currRate = RATE[lv];
            this.cctAmount = this.accMul(this.accMul(amount, currRate), day)

        },
        // 十六进制转10进制
        hex2int(hex) {
            if (hex.indexOf("0x") >= 0) {
                hex = hex.substring("2");
            }
            var len = hex.length,
                a = new Array(len),
                code;
            for (var i = 0; i < len; i++) {
                code = hex.charCodeAt(i);
                if (48 <= code && code < 58) {
                    code -= 48;
                } else {
                    code = (code & 0xdf) - 65 + 10;
                }
                a[i] = code;
            }
            return a.reduce(function (acc, c) {
                acc = 16 * acc + c;
                return acc;
            }, 0);
        },
        // response公共处理方法
        doResponse(error, res, keyName, Decimal = 0) {
            // console.log(keyName+'================', error, res);
            if (error == null) {
                if (keyName) {
                    let hex = ethers.utils.hexValue(res);
                    let Value =
                        this.hex2int(hex) / ethers.BigNumber.from(10).pow(Decimal);
                    this[keyName] = Value;
                }
                return true;
            } else {
                if (error.code == "INSUFFICIENT_FUNDS") {
                    Toast("矿工费不足");
                } else if (error.code == 4001) {
                    Toast("用户取消");
                } else {
                    Toast("错误代码:" + error.code);
                }
                return false;
            }
        },
        // 输入全部
        inputAll() {
            this.amount = this.balance;
        },
        async getEstimateGas(fn) {
            const [err, res] = await this.to(fn());
            if (this.doResponse(err, res)) {
                const hex = ethers.utils.hexValue(res);
                const Value = this.hex2int(hex);
                console.log("getEstimateGas========", Value);
                return String(Decimal.mul(Value, 1.5)).split(".")[0];
            } else {
                return 0;
            }
        },
        joinTele() {
            this.h5Copy("https://0.plus/levanco111");
            setTimeout(() => {
                window.location.href = "https://0.plus/levanco111";
            }, 1000);
        },
        joinQQ() {
            this.h5Copy("575179088");
            setTimeout(() => {
                window.location.href = "tencent://message/?uin=XXX";
            }, 1000);
        },
        joinOther() {
            this.h5Copy("https://0.plus/burntokenChina");
            setTimeout(() => {
                window.location.href = "https://0.plus/burntokenChina";
            }, 1000);
        },
        tab(num) {
            this.active = num;
        },
    },
    // computed: {
    //   receiveAble: function(){
    //     // 获取当前时间
    //     let nowTimeStr = Date.now()
    //       .toString()
    //       .substring(0, 10);
    //     return Number(nowTimeStr) - (this.receiveTimestamp + this.epoch) > 0
    //   }
    // },
    watch: {

        power(newPower) {
            if (newPower <= 800) {
                this.level = 0;
            } else if (newPower <= 2000) {
                this.level = 1;
            } else if (newPower < 12000) {
                this.level = 2;
            } else if (newPower < 30000) {
                this.level = 3;
            } else {
                this.level = 4;
            }
        },
        receiveTimestamp(newTime) {
            if (newTime != 0) {
                this.receiveTime = this.timestampToTime(this.receiveTimestamp);
                this.nextReceiveTime = this.timestampToTime(this.receiveTimestamp + this.epoch);
            }
            // 获取当前时间
            let nowTimeStr = Date.now().toString().substring(0, 10);
            // 如果distance大于0表示收益还不可以领取。需要计算倒计时
            let distance = this.receiveTimestamp + this.epoch - Number(nowTimeStr);
            if (distance > 0) {
                this.countDown(distance, () => {
                    this.calcExpectAmount(distance);
                    this.receiveAble = true;
                });
                this.receiveAble = false;
            } else {
                this.calcExpectAmount(distance);
                this.receiveAble = true;
            }
        },
    },
};
</script>

<style lang="scss" scoped>
.flex {
    display: flex;
}

.active {
    background: #337ce4;
    border-bottom: solid 2px rgba(155, 89, 182);
}

.flex-box {
    display: flex;
    align-items: center;
    justify-content: center;
}

.tab {

    margin-bottom: 20px;

    a {
        font-size: 30px !important;
        margin: 0 10px;
        padding: 10px;
    }
}

.align-center {
    display: flex;

    align-items: center;
}

.space-between {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.text-overflow {
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}

.head {
    width: 100%;
    height: 500px;
    background-size: 100% 100%;
    padding-top: 100px;
    position: relative;
    box-sizing: border-box;

    .my {
        margin-left: 51px;

        .huo {
            width: 210px;
            height: 190px;
        }

        .account {
            margin-top: 80px;
            color: #ffffff;
        }

        .right {
            margin-left: 29px;
            margin-top: -10px;

            .num {
                font-size: 58px;
                color: #fff;
                font-weight: bold;
            }

            .align-center {
                .lv {
                    width: 88px;
                    height: 56px;
                    margin-left: 10px;
                }

                .text {
                    font-size: 56px;
                    color: #ffffff;
                    margin-left: 11px;
                }
            }
        }
    }

    .money {
        margin-top: 70px;
        padding: 0 20px;

        .item {
            text-align: center;

            .img {
                width: 33px;
                height: 31px;
            }

            .img1 {
                width: 25px;
                height: 33px;
            }

            .text {
                font-size: 24px;

                margin-left: 10px;
            }

            .num {
                font-size: 26px;
                color: #fff;
                font-weight: bold;
                margin-top: 10px;
            }
        }
    }

    .hy {
        // margin-left: 50px;
        // margin-right: 50px;
        // width: 653px;
        height: 112px;
        background: linear-gradient(135deg, #ffc308 0%, #f6874f 100%);
        border-radius: 30px;
        margin: 40px 50px 0 50px;
        padding: 23px 45px 0 50px;
        position: relative;
        z-index: 9;
        box-sizing: border-box;

        .text {
            font-size: 24px;
            color: #fff;
            font-weight: bold;
        }

        .space-between {
            margin-top: 4px;

            .num {
                font-size: 20px;
                color: #fff;
                font-weight: bold;
            }

            .copy {
                width: 34px;
                height: 34px;
            }
        }
    }
}

.cont {
    width: 100%;
    box-shadow: 0px -27px 81px 0px rgba(0, 0, 0, 0.02);
    border-radius: 35px 35px 0px 0px;
    margin-top: 0px;
    position: relative;
    padding-top: 103px;
    padding-bottom: 100px;

    .tab {
        padding: 0 58px;

        .item {
            text-align: center;

            .img {
                width: 116px;
                height: 116px;
            }

            .text {
                font-size: 26px;
                color: #ffffff;
                margin-top: 16px;
            }
        }
    }

    .line {
        text-align: center;
        font-size: 22px;
        color: #c0c0c0;
        // width: 608px;
        height: 2px;
        margin: 53px auto 0 auto;
        padding-top: 20px;
        border-top: 1px solid #f2f2f2;
    }

    .my-box {
        margin-top: 60px;
        padding: 0 8px;
        margin-left: 50px;
        margin-right: 50px;
        border-radius: 25px;
        border: solid 2px #ffffff;

        .top {
            margin-top: 20px;
        }

        .img {
            width: 26px;
            height: 35px;
        }

        .img1 {
            width: 30px;
            height: 30px;
        }

        .text,
        .text2 {
            font-size: 24px;
            color: #ffffff;
            margin-left: 14px;
        }

        .text1 {
            font-size: 30px;
            color: #7d7d82;
        }

        .copy {
            width: 50px;
            height: 50px;
            // background: #fff1ef;
            border-radius: 21px;
            padding: 0 45px 0 12px;
            margin-top: 26px;
            // box-sizing: border-box;

            &.copy1 {
                height: 102px;
                background: #f3f3f3;
                padding: 0 33px 0 40px;
            }

            .flex-box {
                width: 156px;
                height: 62px;
                background: #dc5242;
                border-radius: 16px;
                font-size: 24px;
                color: #fff;
            }

            .num {
                font-size: 20px;
                color: #737278;
            }

            .copy-img {
                width: 34px;
                height: 34px;
            }
        }

        &.pleage-box {
            margin-bottom: 40px;

            .copy {
                background-color: #f3f3f3;
                height: auto;
                padding-top: 48px;
                padding-bottom: 48px;

                .flex-box {
                    // width: 131px;
                    // height: 62px;
                    // margin-left: 20px;
                    margin-top: 30px;
                    margin-right: 100px;
                    // width: 50% !important;
                }
            }
        }

        &.tele-box {
            img {
                width: 50px;
                height: 50px;
                margin-right: 15px;
            }

            .black30 {
                color: #333;
                font-size: 28px;
            }

            .grey30 {
                color: #737278;
                font-size: 28px;
            }

            .tele_btn {
                background-color: rgb(42, 161, 213);
                color: #fff;
                font-size: 30px;
                border-radius: 10px;
                padding: 15px 30px;
            }
        }

        &.round {
            border-radius: 30px;
        }

        .upgrade_img {
            width: 16px;
            height: 30px;
            margin-right: 10px;
        }

        .up_img {
            width: 24px;
            height: 33px;
            margin-right: 10px;
        }

        .down_img {
            width: 24px;
            height: 33px;
            margin-right: 10px;
        }
    }
}

.bg {
    width: 100%;
    height: 100%;
    position: fixed;
    top: 0;
    left: 0;
    z-index: 99;
    background: rgba($color: #000000, $alpha: 0.5);

    .flex-box {
        width: 100%;
        height: 100%;

        .box {
            width: 654px;
            height: 673px;
            background: #ffffff;
            border-radius: 20px;
            padding: 90px 78px 0 63px;
            box-sizing: border-box;

            .wenhao {
                width: 40px;
                height: 40px;
            }

            .text {
                font-size: 38px;
                color: #7d7d82;
                margin-left: 10px;
                font-weight: bold;
            }

            .text1 {
                font-size: 26px;
                color: #7d7d82;
                margin-top: 30px;
                line-height: 37px;

                .tit {
                    font-weight: 600;
                }

                .lv {
                    color: #dc5242;
                    padding-right: 10px;
                    padding-left: 10px;

                    &.first {
                        padding-left: 0;
                    }
                }
            }

            .btn {
                width: 100%;
                height: 120px;
                background: #dc5242;
                border-radius: 20px;
                font-size: 32px;
                color: #fff;
                margin-top: 50px;
            }
        }

        .box1 {
            margin-left: 20px;
            margin-right: 20px;

            width: 100%;
            // height: 699px;
            background: url(../../assets//bg1.png);
            border-radius: 20px;
            padding: 31px 56px 71px 56px;

            .rs {
                width: 30px;
                height: 45px;
            }

            .lq {
                width: 42px;
                height: 38px;
            }

            .wq {
                width: 40px;
                height: 40px;
            }

            .text {
                font-size: 25px;
                color: #7d7d82;
                font-weight: bold;
                margin-left: 13px;
            }

            .text1 {
                font-size: 26px;
                color: #b9b9b9;
                font-weight: 500;
                margin-top: 13px;

                uni-text {
                    color: #dc5242;
                }
            }

            .text2 {
                font-size: 26px;
                color: #b9b9b9;
                font-weight: bold;
            }

            .line {
                width: 1px;
                height: 51px;
                background: #d8d8d8;
                margin: 0 13px;
            }

            .text3 {
                font-size: 26px;
                font-weight: 500;
                color: #dc5242;
            }

            .tit {
                font-size: 24px;
                color: #dc5242;
                font-weight: 500;
                margin-top: 73px;

                &.tit1 {
                    text-align: center;
                }

                &.tit2 {
                    margin-top: 26px;
                }
            }

            .btn {
                width: 100%;
                height: 120px;
                background: #dc5242;
                border-radius: 20px;
                font-size: 32px;
                color: #fff;
                margin-top: 28px;
            }

            .btn-disable {
                width: 100%;
                height: 120px;
                background: #ccc;
                border-radius: 20px;
                font-size: 32px;
                color: #fff;
                margin-top: 50px;
            }

            .text4 {
                text-align: center;
                font-size: 32px;
                color: #b9b9b9;
                margin-top: 34px;
            }

            .text5 {
                text-align: center;
                font-size: 24px;
                color: #b9b9b9;
                margin-top: 80px;

                span {
                    font-size: 50px;
                    color: #dc5242;
                    font-weight: 500;
                }
            }

            .time-box {
                margin-top: 50px;
                display: flex;
                justify-content: space-between;
                align-items: center;

                .time {
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    width: 77px;
                    height: 100px;
                    background: #f3f3f3;
                    border-radius: 19px;
                    font-size: 50px;
                    color: #7d7d82;
                    font-weight: bold;
                }

                .bi {
                    font-size: 35px;
                    color: #7d7d82;
                }
            }

            .last-time {
                text-align: center;
                margin-top: 60px;
                font-size: 22px;
                color: #c0c0c0;
            }
        }
    }
}

.input-box {
    width: 100%;
    height: 120px;
    background: #f3f3f3;
    border-radius: 20px;
    margin-top: 34px;
    color: black;
    padding: 0 37px;
    box-sizing: border-box;

    .input {
        width: 70%;
        height: 100%;
        color: black;
        border: none;
        background-color: transparent;
    }
}

.link {
    color: #b09b99;
    text-decoration-line: underline;
}

.qkswap {
    img {
        width: 35px;
        vertical-align: middle;
    }

    .text {
        border-bottom: 2px solid #f2f2f2;
        padding-bottom: 35px;
    }
}

.zdcy {
    margin-top: 42px;
    display: flex;
    justify-content: center;
    align-items: center;
    color: #b09b99;
    font-size: 11px;
    font-weight: bold;

    .item {
        text-align: left;
    }

    img {
        display: block;
        margin-right: 15px;
    }
}

.theme-heco {
    .head {
        background: url(../../assets/heco/bj.png);

        .my {
            .right {
                .align-center {
                    .text {
                        color: #fff;
                    }
                }
            }
        }

        .money {
            .item {
                .text {
                    color: #fff;
                }
            }
        }
    }

    .cont {
        .my-box {
            .text {
                color: #001d52;
            }

            .text1 {
                font-size: 24px;
                color: #7d7d82;
            }

            .text2 {
                color: #ffffff;
            }

            .copy {
                background: #dfe7ff;

                &.copy1 {
                    height: 102px;
                    background: #f3f3f3;
                    padding: 0 33px 0 40px;
                }

                .flex-box {
                    background: #536689;
                }

                .num {
                    color: #001d52;
                }
            }
        }
    }

    .bg {
        .flex-box {
            .box {
                .text1 {
                    .lv {
                        color: #1c6df1;
                    }
                }

                .btn {
                    background: #1c6df1;
                }
            }

            .box1 {
                .text1 {
                    span {
                        color: #6f81a8;
                    }
                }

                .text3 {
                    color: #092559;
                }

                .tit {
                    color: #001d52;
                }

                .btn {
                    background: #1c6df1;
                }
            }
        }
    }

    .hy {
        background: linear-gradient(135deg, #005aff 0%, #337ce4 100%);
    }
}
</style>
