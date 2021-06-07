Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA54239EE9A
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Jun 2021 08:21:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82CA3C58D7E;
	Tue,  8 Jun 2021 06:21:16 +0000 (UTC)
Received: from out28-50.mail.aliyun.com (out28-50.mail.aliyun.com
 [115.124.28.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8D0CEC58D79
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Jun 2021 17:28:20 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.8995042|0.7245346; CH=green;
 DM=|SPAM|false|; DS=CONTINUE|ham_regular_dialog|0.0829513-0.00479038-0.912258;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047207; MF=zhouyanjie@wanyeetech.com;
 NM=1; PH=DS; RN=20; RT=20; SR=0; TI=SMTPD_---.KP.FCzB_1623086888; 
Received: from
 zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com
 fp:SMTPD_---.KP.FCzB_1623086888)
 by smtp.aliyun-inc.com(10.147.40.44); Tue, 08 Jun 2021 01:28:17 +0800
From: =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?=
 <zhouyanjie@wanyeetech.com>
To: davem@davemloft.net, kuba@kernel.org, robh+dt@kernel.org,
 peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com
Date: Tue,  8 Jun 2021 01:27:46 +0800
Message-Id: <1623086867-119039-2-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1623086867-119039-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1623086867-119039-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 08 Jun 2021 06:21:15 +0000
Cc: devicetree@vger.kernel.org, jun.jiang@ingenic.com, sernia.zhou@foxmail.com,
 rick.tyliu@ingenic.com, netdev@vger.kernel.org, sihui.liu@ingenic.com,
 aric.pzqi@ingenic.com, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, paul@crapouillou.net, dongsheng.qiu@ingenic.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/2] dt-bindings: dwmac: Add bindings for new
	Ingenic SoCs.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

QWRkIHRoZSBkd21hYyBiaW5kaW5ncyBmb3IgdGhlIEpaNDc3NSBTb0MsIHRoZSBYMTAwMCBTb0Ms
CnRoZSBYMTYwMCBTb0MsIHRoZSBYMTgzMCBTb0MgYW5kIHRoZSBYMjAwMCBTb0MgZnJvbSBJbmdl
bmljLgoKU2lnbmVkLW9mZi1ieTog5ZGo55Cw5p2wIChaaG91IFlhbmppZSkgPHpob3V5YW5qaWVA
d2FueWVldGVjaC5jb20+Ci0tLQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25l
dC9zbnBzLGR3bWFjLnlhbWwgfCAxNSArKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAx
NSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL25ldC9zbnBzLGR3bWFjLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbmV0L3NucHMsZHdtYWMueWFtbAppbmRleCAyZWRkOGJlLi45YzBjZTkyIDEwMDY0NAot
LS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3NucHMsZHdtYWMueWFt
bAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3NucHMsZHdtYWMu
eWFtbApAQCAtNTYsNiArNTYsMTEgQEAgcHJvcGVydGllczoKICAgICAgICAgLSBhbWxvZ2ljLG1l
c29uOG0yLWR3bWFjCiAgICAgICAgIC0gYW1sb2dpYyxtZXNvbi1neGJiLWR3bWFjCiAgICAgICAg
IC0gYW1sb2dpYyxtZXNvbi1heGctZHdtYWMKKyAgICAgICAgLSBpbmdlbmljLGp6NDc3NS1tYWMK
KyAgICAgICAgLSBpbmdlbmljLHgxMDAwLW1hYworICAgICAgICAtIGluZ2VuaWMseDE2MDAtbWFj
CisgICAgICAgIC0gaW5nZW5pYyx4MTgzMC1tYWMKKyAgICAgICAgLSBpbmdlbmljLHgyMDAwLW1h
YwogICAgICAgICAtIHJvY2tjaGlwLHB4MzAtZ21hYwogICAgICAgICAtIHJvY2tjaGlwLHJrMzEy
OC1nbWFjCiAgICAgICAgIC0gcm9ja2NoaXAscmszMjI4LWdtYWMKQEAgLTMxMCw2ICszMTUsMTEg
QEAgYWxsT2Y6CiAgICAgICAgICAgICAgIC0gYWxsd2lubmVyLHN1bjhpLXI0MC1lbWFjCiAgICAg
ICAgICAgICAgIC0gYWxsd2lubmVyLHN1bjhpLXYzcy1lbWFjCiAgICAgICAgICAgICAgIC0gYWxs
d2lubmVyLHN1bjUwaS1hNjQtZW1hYworICAgICAgICAgICAgICAtIGluZ2VuaWMsano0Nzc1LW1h
YworICAgICAgICAgICAgICAtIGluZ2VuaWMseDEwMDAtbWFjCisgICAgICAgICAgICAgIC0gaW5n
ZW5pYyx4MTYwMC1tYWMKKyAgICAgICAgICAgICAgLSBpbmdlbmljLHgxODMwLW1hYworICAgICAg
ICAgICAgICAtIGluZ2VuaWMseDIwMDAtbWFjCiAgICAgICAgICAgICAgIC0gc25wcyxkd3hnbWFj
CiAgICAgICAgICAgICAgIC0gc25wcyxkd3hnbWFjLTIuMTAKICAgICAgICAgICAgICAgLSBzdCxz
cGVhcjYwMC1nbWFjCkBAIC0zNTMsNiArMzYzLDExIEBAIGFsbE9mOgogICAgICAgICAgICAgICAt
IGFsbHdpbm5lcixzdW44aS1yNDAtZW1hYwogICAgICAgICAgICAgICAtIGFsbHdpbm5lcixzdW44
aS12M3MtZW1hYwogICAgICAgICAgICAgICAtIGFsbHdpbm5lcixzdW41MGktYTY0LWVtYWMKKyAg
ICAgICAgICAgICAgLSBpbmdlbmljLGp6NDc3NS1tYWMKKyAgICAgICAgICAgICAgLSBpbmdlbmlj
LHgxMDAwLW1hYworICAgICAgICAgICAgICAtIGluZ2VuaWMseDE2MDAtbWFjCisgICAgICAgICAg
ICAgIC0gaW5nZW5pYyx4MTgzMC1tYWMKKyAgICAgICAgICAgICAgLSBpbmdlbmljLHgyMDAwLW1h
YwogICAgICAgICAgICAgICAtIHNucHMsZHdtYWMtNC4wMAogICAgICAgICAgICAgICAtIHNucHMs
ZHdtYWMtNC4xMGEKICAgICAgICAgICAgICAgLSBzbnBzLGR3bWFjLTQuMjBhCi0tIAoyLjcuNAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
