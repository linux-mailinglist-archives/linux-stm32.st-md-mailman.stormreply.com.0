Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 512153A6CEE
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Jun 2021 19:18:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00C0DC597B1;
	Mon, 14 Jun 2021 17:18:03 +0000 (UTC)
Received: from out28-148.mail.aliyun.com (out28-148.mail.aliyun.com
 [115.124.28.148])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E08A6C597AE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Jun 2021 17:18:00 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.3305371|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.00425795-0.000892991-0.994849;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047208; MF=zhouyanjie@wanyeetech.com;
 NM=1; PH=DS; RN=21; RT=21; SR=0; TI=SMTPD_---.KSAJpVJ_1623691068; 
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com
 fp:SMTPD_---.KSAJpVJ_1623691068)
 by smtp.aliyun-inc.com(10.147.41.121);
 Tue, 15 Jun 2021 01:17:57 +0800
From: =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?=
 <zhouyanjie@wanyeetech.com>
To: davem@davemloft.net, kuba@kernel.org, robh+dt@kernel.org,
 peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, matthias.bgg@gmail.com
Date: Tue, 15 Jun 2021 01:15:35 +0800
Message-Id: <1623690937-52389-1-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alexandre.torgue@st.com,
 sernia.zhou@foxmail.com, rick.tyliu@ingenic.com, netdev@vger.kernel.org,
 sihui.liu@ingenic.com, aric.pzqi@ingenic.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, dongsheng.qiu@ingenic.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 jun.jiang@ingenic.com
Subject: [Linux-stm32] [PATCH v3 0/2] Add Ingenic SoCs MAC support.
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

djItPnYzOgoxLkFkZCAiaW5nZW5pYyxtYWMueWFtbCIgZm9yIEluZ2VuaWMgU29Dcy4KMi5DaGFu
Z2UgdHggY2xrIGRlbGF5IGFuZCByeCBjbGsgZGVsYXkgZnJvbSBoYXJkd2FyZSB2YWx1ZSB0byBw
cy4KMy5yZXR1cm4gLUVJTlZBTCB3aGVuIGEgdW5zdXBwb3J0ZWQgdmFsdWUgaXMgZW5jb3VudGVy
ZWQgd2hlbgogIHBhcnNpbmcgdGhlIGJpbmRpbmcuCjQuU2ltcGxpZnkgdGhlIGNvZGUgb2YgdGhl
IFJHTUlJIHBhcnQgb2YgWDIwMDAgU29DIGFjY29yZGluZyB0bwogIEFuZHJldyBMdW5u4oCZcyBz
dWdnZXN0aW9uLgo1LkZvbGxvdyB0aGUgZXhhbXBsZSBvZiAiZHdtYWMtbWVkaWF0ZWsuYyIgdG8g
aW1wcm92ZSB0aGUgY29kZQogIHRoYXQgaGFuZGxlcyBkZWxheXMgYWNjb3JkaW5nIHRvIEFuZHJl
dyBMdW5u4oCZcyBzdWdnZXN0aW9uLgoK5ZGo55Cw5p2wIChaaG91IFlhbmppZSkgKDIpOgogIGR0
LWJpbmRpbmdzOiBkd21hYzogQWRkIGJpbmRpbmdzIGZvciBuZXcgSW5nZW5pYyBTb0NzLgogIG5l
dDogc3RtbWFjOiBBZGQgSW5nZW5pYyBTb0NzIE1BQyBzdXBwb3J0LgoKIC4uLi9kZXZpY2V0cmVl
L2JpbmRpbmdzL25ldC9pbmdlbmljLG1hYy55YW1sICAgICAgIHwgIDc2ICsrKysKIC4uLi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL25ldC9zbnBzLGR3bWFjLnlhbWwgICAgICAgIHwgIDE1ICsKIGRyaXZl
cnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL0tjb25maWcgICAgICAgIHwgIDEyICsKIGRy
aXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL01ha2VmaWxlICAgICAgIHwgICAxICsK
IC4uLi9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtaW5nZW5pYy5jICAgIHwgNDAx
ICsrKysrKysrKysrKysrKysrKysrKwogNSBmaWxlcyBjaGFuZ2VkLCA1MDUgaW5zZXJ0aW9ucygr
KQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9u
ZXQvaW5nZW5pYyxtYWMueWFtbAogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbmV0L2V0aGVy
bmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLWluZ2VuaWMuYwoKLS0gCjIuNy40CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
