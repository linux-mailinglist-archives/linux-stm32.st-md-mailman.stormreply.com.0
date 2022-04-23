Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B291950CDFD
	for <lists+linux-stm32@lfdr.de>; Sun, 24 Apr 2022 00:58:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 645A8C6049A;
	Sat, 23 Apr 2022 22:58:13 +0000 (UTC)
Received: from de-smtp-delivery-213.mimecast.com
 (de-smtp-delivery-213.mimecast.com [194.104.109.213])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5CEEDC60492
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 23 Apr 2022 22:58:11 +0000 (UTC)
Received: from CHE01-GV0-obe.outbound.protection.outlook.com
 (mail-gv0che01lp2046.outbound.protection.outlook.com [104.47.22.46]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-y2nhIAIUOFepsUb6n-Cwkg-1; Sun, 24 Apr 2022 00:58:09 +0200
X-MC-Unique: y2nhIAIUOFepsUb6n-Cwkg-1
Received: from ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:3b::9) by
 GV0P278MB0356.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:33::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.13; Sat, 23 Apr 2022 22:58:08 +0000
Received: from ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM
 ([fe80::dd15:e6d7:a4d0:7207]) by ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM
 ([fe80::dd15:e6d7:a4d0:7207%7]) with mapi id 15.20.5186.020; Sat, 23 Apr 2022
 22:58:07 +0000
From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
To: "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Thread-Topic: net: stmmac: dwmac-imx: half duplex crash
Thread-Index: AQHYV2WZ5uT4Cdlm/Umu1AAuySf2Og==
Date: Sat, 23 Apr 2022 22:58:07 +0000
Message-ID: <36ba455aad3e57c0c1f75cce4ee0f3da69e139a1.camel@toradex.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 55bd4fb6-4484-4867-cc3a-08da257cbb8e
x-ms-traffictypediagnostic: GV0P278MB0356:EE_
x-microsoft-antispam-prvs: <GV0P278MB0356190F8E63D9F8DFEE35FCFBF69@GV0P278MB0356.CHEP278.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: SvS17ZIvBCQzFScfQs8WpGapaa/+rvlUTjLzgeWJWtSSCqndCThTVUj+9DnpCZUPpzgkn+OvgUi/OeQvYyn8sr8P3GWv2y+RvncvwMA8flDRV9Wv1NagL83jRLqVluvIDjbFQuTuDtpLaZ2aAtAqO6G847YFEUOWGebbR1HNIlI4WM6EOfrYgYnH9sITsakxScqPdONAi3IiXw7wWzTQmqn+Mnyn43nk1S6JDLJUNhYe9+CSjALyiS230gXp/aqAEGOEf12pxZj2GiUhxEWgoBqEHfIrziMpZKOwZg+8LyqPm5lk0pjscUAVZf9uPhMUnOQZRjs3GuZSKsYQsHrraIHAOySCL6frhFEhse0FZvNiJ+krYRnZq9eaCq4wtTwleKHmUQxZu5zDNDGKnK2CPCYjKuSjSF2bbdFwa2aSY2orjd/wbgLsgpR0Kbpo1FUbyRGOHZvF3Pz3idgEjInZhUifs6KLksxNpKkhyV7uhc3HCnW7NyLtT4eVU2+/U8IMSUz+ozS2FFXtIYQU2hBve3sqqE8Vp33ldqxYWr3PHQ/f69QlmY6fCulLdIva3KSeKBqa0YTMusBFOkXHMToEQBdPJORngoSVhp0ieQw3WWwC+XRPgv6ofnHeaN6zeAKrO2NDFxGcYxXRn0fDVlGq9Ru8hu3FxrCvtp4LLG3l/Ajd0ML5Jp9La6vEFxfNMzFhyz5FO/bOGIk+J0EalZWGVLuWuQXuBjDimgLFbwAgIvYIi7ZMuA3go7eqNvC/7CfUvg2X0W1ECZDNN/Gq9AbXoR1lPCDrGLsDryhYDk1LmWk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(376002)(39840400004)(396003)(346002)(136003)(366004)(76116006)(66556008)(66946007)(4326008)(8676002)(6506007)(38070700005)(38100700002)(2906002)(316002)(36756003)(71200400001)(54906003)(64756008)(122000001)(6916009)(83380400001)(5660300002)(8936002)(66476007)(66446008)(86362001)(6486002)(966005)(7416002)(508600001)(45080400002)(26005)(6512007)(44832011)(186003)(2616005);
 DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cWtGZmJ6cHBmc2JwZWp1Ums0S01yb1RTNmpBcmlpM2E3SHM0eFBRRlpMMGY2?=
 =?utf-8?B?R1U4cjRVcmVwUGt2YzZJOUxRbG13d1lwVSs3aW5YM005K0hLaEVBcXFvNHg5?=
 =?utf-8?B?aHVqcWpZUEhwKzRlMlE1MU5zUTZrbkFOeHROVXVpUkJHT0dhcnI1SnhybXZB?=
 =?utf-8?B?YStER0FKbHBNcFJHeGpLRW9naWxXQzMyZ0FLL2lzWEJYdmwrSWVUUUpZMS9S?=
 =?utf-8?B?MFZycnREZ2wrL2FsK2NhU0xCa3lhYmdTUm5WeTBkbUxSa2drL1hTelFESWtB?=
 =?utf-8?B?RDlmL2R3Z0VvUjBtSDd5SVo5NlV2M2xSNnphLzBodUNOMGRONkZwZ01tRFB1?=
 =?utf-8?B?QUtQMENqN1QzZEVkaXVsZlorWnhMSG1tUDhBazBxbEhaajhSckFKVlErTUp3?=
 =?utf-8?B?SFRLSXRlZHQ5MHBtUUN6SXZETjhDWmp1TGNJUWFCK1AvYWZWcGUwZDYrVWhq?=
 =?utf-8?B?R2h5aEN6OHF4L0oyVVdWbDlYT0xENE5mY241K2gwZExsejVZOUhYNkNTQnVC?=
 =?utf-8?B?SnFKWEJISVNBMHdabDdJYmliTU0zL3FQNStnR3BWMU5xMEdpRzEzVDBUU2lU?=
 =?utf-8?B?T2VqTGhXQWU4QklJVUZ6dXRYWkFKeE8xZGJLNHI1M2taTEpCWXJlYkoxbCt2?=
 =?utf-8?B?a3JjNVJHenkrcG5naUlnN2swWUZ1bVlob0UrSHZOeDlJK0VZaUpCbmhSdFNz?=
 =?utf-8?B?SHBYdXVjOTNJQnBQWlV4MU5EV1dlTnZBazZDMWFKY2VBeHpxOUlIMkNWeTZq?=
 =?utf-8?B?UkRxcExsSTR3WVFld3JhZmFSdGdRQW5Gb1FreHFnRFd4Y3ZyMXlVQVFtVUQ2?=
 =?utf-8?B?Q2pSNlZxdWpGc1lQbmR2OXR6WU1NdU9IUW9ka2E1TXh2SnFrRWdUaHBnMVFx?=
 =?utf-8?B?eGdQWGt5Vy92ZjFJNEFWRUJVYnI2Z0VyZ1pPS295MnVVN0JlV2VjdEFKK3Q3?=
 =?utf-8?B?QnVBTmJ3dm10NFkzcEdvdnFmWUx4NVBEQjd6dXlVUUs5OFoxendPenptcG9w?=
 =?utf-8?B?S1hlYTN5SmhSTXplM2VXejJJdmIxaTBtLzUzZUlKL1ZOL21RczY0cXdVUGFj?=
 =?utf-8?B?QWxHSWZkcHI3SUFDVkdDamVFdFEzbkVVaHRKcE1Ed0dxZGhTMWdVdFA1ODZs?=
 =?utf-8?B?TXJDWnlkUEZudU9iZmR4dDA0SGU3NFllb01WV2x1L2xkbnJzaWo1a2t5cE0y?=
 =?utf-8?B?SDRiQnpMR21ZcGF5YkRLc2hnOWhrUmtDUXBwdzltMTV6b1ZUS096NFVoNnYw?=
 =?utf-8?B?bDdRWFViNGtWTTVuOFBzbEh6RThxSC82VnhFQXRsdjRJVTU2UUxBckF4aGdW?=
 =?utf-8?B?dXU0b3ZUeC9kd3c5blZWQkl2YmtKMXRKNm5KQWdYbk5tRG1pSlNsZ2VDaEF5?=
 =?utf-8?B?alBOdVg2Z1ovU2c0QkhTMVQwL1FjaE5SWVMxcy9ORkx4d3FyRGMvZHJJdmVY?=
 =?utf-8?B?UDFLdXBvdHpmaHVpMlZHd1pBcVJOQTlBTEUrNW9RQUVoRUJ3V05aUlVndWNB?=
 =?utf-8?B?Um1OcC9pWmJ1SEZTTVdsVWVjRnlTL1NkZUxLK0JRenFOTllWYUNXZkdaWFc2?=
 =?utf-8?B?TU15ZEZvMS9JV2FiTVRDaWY5emV5OVFPVEloeGtTU2pLbktWSDBiVWJGVjZY?=
 =?utf-8?B?dnVYL3d2YUxsYkhqN0NJU000NHFYcXZ1aWtRenJrUXlDOThoVjhWRy9nczBt?=
 =?utf-8?B?dXgzUjIzSFhTSENjWmN1TEd6TUxkM0ZIRDFKbUZ5QWgwOTcvU3BsUG5PcFRD?=
 =?utf-8?B?dGhNcGFYRzdaZzIyUEpkMXdPTDZpWWZNY09EVUcwbjhXVzNieDdpNmNNY2Mv?=
 =?utf-8?B?TWtpRzdCemplNmh5bW9qRlJTWnhwZ2Fud0RFUzlWVzlxc0Q4ZDZYcWFLK1Jp?=
 =?utf-8?B?NjlBU1Y0Rjg2N1dDN2dTNC9LbkppZWYwV1ZlOW12RnJUK3pKUHFoQ24zRmli?=
 =?utf-8?B?K05BaHU1V2hQSVhycGpNbzh2TGtucmo0Y0Z6RDlFOFNuZU9SR0RkdG9vNjZu?=
 =?utf-8?B?OFJPM1VEY3U5R3p4eVpFaG1NUWhVS2RBalk3VkE2bVk4TGhOQlRibWFCaGRN?=
 =?utf-8?B?U2dSUmJuUGpVQnVxSDNDdTVsSzRGQmRvSFVpOHdzL2hZMnRIT3NTbkRHSUpF?=
 =?utf-8?B?RHdUQjlzeTU4Y3ZEUlUzOWhmcWovUjY4bmF1ZU5ubmZQcHg1NlhFdStpRGhh?=
 =?utf-8?B?S1d5dmRibjZlNmtydEQ2YlBjYnNWTHdTWFdsSXZESTVLdXBIaU45Uk4zZ2NP?=
 =?utf-8?B?bjY4b3F1OUxwdDdSbjQrajFMczZuUVppT2VLZ3gyNG05WTk2TlVkaFg0L1RW?=
 =?utf-8?B?ZkhqTXEzdEZReVZvNXUzVjdPVXB5SnVhMXJlaFo1YmIyaTViVExyMVZyR2xj?=
 =?utf-8?Q?VZF393wKYaqekqXNfLjj7FTwhvI1qVnQ/dCgX?=
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 55bd4fb6-4484-4867-cc3a-08da257cbb8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2022 22:58:07.8591 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b0VtaWwPb9BMImrVktmK965WCo804eaPukh6plM2QSzyvX70rhAYTVgrUkiPN2NCMRRgZhLveIotJXQY+q15LfoIrFbpJm2G6cOtDs7TWTk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB0356
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CDE13A77 smtp.mailfrom=marcel.ziswiler@toradex.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: toradex.com
Content-Language: en-US
Content-ID: <1372816D226B4F40816FEE49CE0F6814@CHEP278.PROD.OUTLOOK.COM>
Cc: "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "kuba@kernel.org" <kuba@kernel.org>,
 "joabreu@synopsys.com" <joabreu@synopsys.com>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "pabeni@redhat.com" <pabeni@redhat.com>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: [Linux-stm32] net: stmmac: dwmac-imx: half duplex crash
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi there

We lately tried operating the IMX8MPEVK ENET_QOS imx-dwmac driver in half-duplex modes which crashes as
follows:

root@imx8mpevk:~# uname -a
Linux imx8mpevk 5.18.0-rc2-next-20220413-00006-gc741306ff2ed #4 SMP PREEMPT Wed Apr 13 15:08:36 CEST 2022
aarch64 aarch64 aarch64 GNU/Linux
root@imx8mpevk:~# ethtool -s eth1 advertise 0x004
[  469.685304] imx-dwmac 30bf0000.ethernet eth1: Link is Down
[  469.703528] kauditd_printk_skb: 1 callbacks suppressed
[  469.703539] audit: type=1334 audit(1650754238.319:23): prog-id=17 op=LOAD
[  469.715602] audit: type=1334 audit(1650754238.327:24): prog-id=18 op=LOAD
[  472.737884] imx-dwmac 30bf0000.ethernet eth1: Link is Up - 100Mbps/Half - flow control off
[  472.746205] IPv6: ADDRCONF(NETDEV_CHANGE): eth1: link becomes ready
[  478.080481] ------------[ cut here ]------------
[  478.085134] NETDEV WATCHDOG: eth1 (imx-dwmac): transmit queue 1 timed out
[  478.091985] WARNING: CPU: 3 PID: 0 at net/sched/sch_generic.c:529 dev_watchdog+0x200/0x210
[  478.100269] Modules linked in: 8021q garp mrp stp llc overlay bluetooth ecdh_generic ecc rfkill caam_jr
caamhash_desc caamalg_desc crypto_engine rng_core authenc libdes dwmac_imx stmmac_platform imx_sdma
crct10dif_ce fsl_imx8_ddr_perf stmmac pcs_xpcs etnaviv gpu_sched flexcan caam snvs_pwrkey error can_dev
rtc_snvs imx_cpufreq_dt imx8mm_thermal fuse drm ipv6
[  478.132142] CPU: 3 PID: 0 Comm: swapper/3 Not tainted 5.18.0-rc2-next-20220413-00006-gc741306ff2ed #4
[  478.141364] Hardware name: NXP i.MX8MPlus EVK board (DT)
[  478.146676] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[  478.153644] pc : dev_watchdog+0x200/0x210
[  478.157662] lr : dev_watchdog+0x200/0x210
[  478.161680] sp : ffff80000a3b3a70
[  478.164992] x29: ffff80000a3b3a70 x28: 0000000000000005 x27: ffff800008e57600
[  478.172140] x26: ffff800009ef79c0 x25: ffff00017f3c7fe8 x24: ffff80000a3b3b40
[  478.179283] x23: ffff800009ef7000 x22: 0000000000000001 x21: ffff0000c4cc039c
[  478.186428] x20: ffff0000c4cc0000 x19: ffff0000c4cc0448 x18: 0000000000000030
[  478.193571] x17: ffff800175a13000 x16: ffff80000a2e4000 x15: ffffffffffffffff
[  478.200713] x14: ffff800009f12388 x13: 00000000000004ec x12: 00000000000001a4
[  478.207860] x11: 712074696d736e61 x10: ffff800009f6a388 x9 : 00000000fffff000
[  478.215003] x8 : ffff800009f12388 x7 : 0000000000000003 x6 : 0000000000000000
[  478.222146] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000000
[  478.229294] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0000c01a0000
[  478.236439] Call trace:
[  478.238886]  dev_watchdog+0x200/0x210
[  478.242556]  call_timer_fn.constprop.0+0x24/0x80
[  478.247182]  __run_timers.part.0+0x1f4/0x23c
[  478.251454]  run_timer_softirq+0x3c/0x7c
[  478.255384]  __do_softirq+0x124/0x2a0
[  478.259047]  __irq_exit_rcu+0xe4/0x100
[  478.262804]  irq_exit_rcu+0x10/0x1c
[  478.266300]  el1_interrupt+0x38/0x70
[  478.269881]  el1h_64_irq_handler+0x18/0x24
[  478.273988]  el1h_64_irq+0x64/0x68
[  478.277393]  arch_cpu_idle+0x18/0x2c
[  478.280969]  default_idle_call+0x24/0x6c
[  478.284900]  do_idle+0x22c/0x29c
[  478.288133]  cpu_startup_entry+0x28/0x30
[  478.292065]  secondary_start_kernel+0x140/0x164
[  478.296600]  __secondary_switched+0xa0/0xa4
[  478.300789] ---[ end trace 0000000000000000 ]---
[  478.305451] imx-dwmac 30bf0000.ethernet eth1: Reset adapter.
[  478.332901] imx-dwmac 30bf0000.ethernet eth1: FPE workqueue stop
[  478.339233] imx-dwmac 30bf0000.ethernet eth1: Timeout accessing MAC_VLAN_Tag_Filter
[  478.346962] imx-dwmac 30bf0000.ethernet eth1: failed to kill vid 0081/0
[  478.556494] imx-dwmac 30bf0000.ethernet eth1: PHY [stmmac-1:01] driver [RTL8211F Gigabit Ethernet]
(irq=POLL)
[  478.736560] imx-dwmac 30bf0000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-0
[  478.744388] imx-dwmac 30bf0000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-1
[  478.752222] imx-dwmac 30bf0000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-2
[  478.760126] imx-dwmac 30bf0000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-3
[  478.767951] imx-dwmac 30bf0000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-4
[  478.784520] imx-dwmac 30bf0000.ethernet eth1: No Safety Features support found
[  478.791787] imx-dwmac 30bf0000.ethernet eth1: IEEE 1588-2008 Advanced Timestamp supported
[  478.800227] imx-dwmac 30bf0000.ethernet eth1: registered PTP clock
[  478.806610] imx-dwmac 30bf0000.ethernet eth1: FPE workqueue start
[  478.812774] imx-dwmac 30bf0000.ethernet eth1: configuring for phy/rgmii-id link mode
[  478.848739] 8021q: adding VLAN 0 to HW filter on device eth1

Does anybody have any experience in running dwmac in half-duplex mode? Any suggestions?

BTW: It also crashes the same way running NXP's latest downstream LF5.15.5_1.0.0 which I reported here [1].

[1]
https://community.nxp.com/t5/i-MX-Processors/IMX8MPEVK-ENET-QOS-imx-dwmac-Half-Duplex-Crashes/m-p/1448085#M189597

Cheers

Marcel
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
