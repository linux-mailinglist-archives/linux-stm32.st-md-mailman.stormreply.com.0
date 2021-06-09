Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F73F3A1BE1
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Jun 2021 19:35:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F3DEC58D5D;
	Wed,  9 Jun 2021 17:35:38 +0000 (UTC)
Received: from out28-49.mail.aliyun.com (out28-49.mail.aliyun.com
 [115.124.28.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B37E8C57B78
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Jun 2021 17:35:35 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.9020496|0.6613592; CH=green;
 DM=|SPAM|false|; DS=CONTINUE|ham_regular_dialog|0.0829513-0.00479038-0.912258;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047209; MF=zhouyanjie@wanyeetech.com;
 NM=1; PH=DS; RN=20; RT=20; SR=0; TI=SMTPD_---.KQ26pE3_1623260120; 
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com
 fp:SMTPD_---.KQ26pE3_1623260120)
 by smtp.aliyun-inc.com(10.147.41.138);
 Thu, 10 Jun 2021 01:35:31 +0800
From: =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?=
 <zhouyanjie@wanyeetech.com>
To: davem@davemloft.net, kuba@kernel.org, robh+dt@kernel.org,
 peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com
Date: Thu, 10 Jun 2021 01:35:09 +0800
Message-Id: <1623260110-25842-2-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1623260110-25842-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1623260110-25842-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, jun.jiang@ingenic.com, sernia.zhou@foxmail.com,
 rick.tyliu@ingenic.com, netdev@vger.kernel.org, sihui.liu@ingenic.com,
 aric.pzqi@ingenic.com, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, paul@crapouillou.net, dongsheng.qiu@ingenic.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 1/2] dt-bindings: dwmac: Add bindings for
	new Ingenic SoCs.
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
d2FueWVldGVjaC5jb20+Ci0tLQoKTm90ZXM6CiAgICB2MS0+djI6CiAgICBObyBjaGFuZ2UuCgog
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9zbnBzLGR3bWFjLnlhbWwgfCAx
NSArKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9zbnBzLGR3bWFj
LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3NucHMsZHdtYWMu
eWFtbAppbmRleCAyZWRkOGJlLi45YzBjZTkyIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbmV0L3NucHMsZHdtYWMueWFtbAorKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3NucHMsZHdtYWMueWFtbApAQCAtNTYsNiArNTYsMTEg
QEAgcHJvcGVydGllczoKICAgICAgICAgLSBhbWxvZ2ljLG1lc29uOG0yLWR3bWFjCiAgICAgICAg
IC0gYW1sb2dpYyxtZXNvbi1neGJiLWR3bWFjCiAgICAgICAgIC0gYW1sb2dpYyxtZXNvbi1heGct
ZHdtYWMKKyAgICAgICAgLSBpbmdlbmljLGp6NDc3NS1tYWMKKyAgICAgICAgLSBpbmdlbmljLHgx
MDAwLW1hYworICAgICAgICAtIGluZ2VuaWMseDE2MDAtbWFjCisgICAgICAgIC0gaW5nZW5pYyx4
MTgzMC1tYWMKKyAgICAgICAgLSBpbmdlbmljLHgyMDAwLW1hYwogICAgICAgICAtIHJvY2tjaGlw
LHB4MzAtZ21hYwogICAgICAgICAtIHJvY2tjaGlwLHJrMzEyOC1nbWFjCiAgICAgICAgIC0gcm9j
a2NoaXAscmszMjI4LWdtYWMKQEAgLTMxMCw2ICszMTUsMTEgQEAgYWxsT2Y6CiAgICAgICAgICAg
ICAgIC0gYWxsd2lubmVyLHN1bjhpLXI0MC1lbWFjCiAgICAgICAgICAgICAgIC0gYWxsd2lubmVy
LHN1bjhpLXYzcy1lbWFjCiAgICAgICAgICAgICAgIC0gYWxsd2lubmVyLHN1bjUwaS1hNjQtZW1h
YworICAgICAgICAgICAgICAtIGluZ2VuaWMsano0Nzc1LW1hYworICAgICAgICAgICAgICAtIGlu
Z2VuaWMseDEwMDAtbWFjCisgICAgICAgICAgICAgIC0gaW5nZW5pYyx4MTYwMC1tYWMKKyAgICAg
ICAgICAgICAgLSBpbmdlbmljLHgxODMwLW1hYworICAgICAgICAgICAgICAtIGluZ2VuaWMseDIw
MDAtbWFjCiAgICAgICAgICAgICAgIC0gc25wcyxkd3hnbWFjCiAgICAgICAgICAgICAgIC0gc25w
cyxkd3hnbWFjLTIuMTAKICAgICAgICAgICAgICAgLSBzdCxzcGVhcjYwMC1nbWFjCkBAIC0zNTMs
NiArMzYzLDExIEBAIGFsbE9mOgogICAgICAgICAgICAgICAtIGFsbHdpbm5lcixzdW44aS1yNDAt
ZW1hYwogICAgICAgICAgICAgICAtIGFsbHdpbm5lcixzdW44aS12M3MtZW1hYwogICAgICAgICAg
ICAgICAtIGFsbHdpbm5lcixzdW41MGktYTY0LWVtYWMKKyAgICAgICAgICAgICAgLSBpbmdlbmlj
LGp6NDc3NS1tYWMKKyAgICAgICAgICAgICAgLSBpbmdlbmljLHgxMDAwLW1hYworICAgICAgICAg
ICAgICAtIGluZ2VuaWMseDE2MDAtbWFjCisgICAgICAgICAgICAgIC0gaW5nZW5pYyx4MTgzMC1t
YWMKKyAgICAgICAgICAgICAgLSBpbmdlbmljLHgyMDAwLW1hYwogICAgICAgICAgICAgICAtIHNu
cHMsZHdtYWMtNC4wMAogICAgICAgICAgICAgICAtIHNucHMsZHdtYWMtNC4xMGEKICAgICAgICAg
ICAgICAgLSBzbnBzLGR3bWFjLTQuMjBhCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
