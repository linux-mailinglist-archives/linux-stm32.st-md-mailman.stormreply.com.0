Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C62DD39EE99
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Jun 2021 08:21:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 721A0C58D7B;
	Tue,  8 Jun 2021 06:21:16 +0000 (UTC)
Received: from out28-122.mail.aliyun.com (out28-122.mail.aliyun.com
 [115.124.28.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 47BD7C3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Jun 2021 17:28:19 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.5632897|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.00534723-0.0028745-0.991778;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047206; MF=zhouyanjie@wanyeetech.com;
 NM=1; PH=DS; RN=20; RT=20; SR=0; TI=SMTPD_---.KP.FCzB_1623086888; 
Received: from
 zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com
 fp:SMTPD_---.KP.FCzB_1623086888)
 by smtp.aliyun-inc.com(10.147.40.44); Tue, 08 Jun 2021 01:28:16 +0800
From: =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?=
 <zhouyanjie@wanyeetech.com>
To: davem@davemloft.net, kuba@kernel.org, robh+dt@kernel.org,
 peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com
Date: Tue,  8 Jun 2021 01:27:45 +0800
Message-Id: <1623086867-119039-1-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 08 Jun 2021 06:21:15 +0000
Cc: devicetree@vger.kernel.org, jun.jiang@ingenic.com, sernia.zhou@foxmail.com,
 rick.tyliu@ingenic.com, netdev@vger.kernel.org, sihui.liu@ingenic.com,
 aric.pzqi@ingenic.com, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, paul@crapouillou.net, dongsheng.qiu@ingenic.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/2] Add Ingenic SoCs MAC support.
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

MS5BZGQgdGhlIGR3bWFjIGJpbmRpbmdzIGZvciB0aGUgSlo0Nzc1IFNvQywgdGhlIFgxMDAwIFNv
QywKICB0aGUgWDE2MDAgU29DLCB0aGUgWDE4MzAgU29DIGFuZCB0aGUgWDIwMDAgU29DIGZyb20g
SW5nZW5pYy4KMi5BZGQgc3VwcG9ydCBmb3IgSW5nZW5pYyBTb0MgTUFDIGdsdWUgbGF5ZXIgc3Vw
cG9ydCBmb3IgdGhlIHN0bW1hYwogIGRldmljZSBkcml2ZXIuIFRoaXMgZHJpdmVyIGlzIHVzZWQg
b24gZm9yIHRoZSBNQUMgZXRoZXJuZXQgY29udHJvbGxlcgogIGZvdW5kIGluIHRoZSBKWjQ3NzUg
U29DLCB0aGUgWDEwMDAgU29DLCB0aGUgWDE2MDAgU29DLCB0aGUgWDE4MzAgU29DLAogIGFuZCB0
aGUgWDIwMDAgU29DLgoK5ZGo55Cw5p2wIChaaG91IFlhbmppZSkgKDIpOgogIGR0LWJpbmRpbmdz
OiBkd21hYzogQWRkIGJpbmRpbmdzIGZvciBuZXcgSW5nZW5pYyBTb0NzLgogIG5ldDogc3RtbWFj
OiBBZGQgSW5nZW5pYyBTb0NzIE1BQyBzdXBwb3J0LgoKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdz
L25ldC9zbnBzLGR3bWFjLnlhbWwgICAgICAgIHwgIDE1ICsKIGRyaXZlcnMvbmV0L2V0aGVybmV0
L3N0bWljcm8vc3RtbWFjL0tjb25maWcgICAgICAgIHwgIDE2ICstCiBkcml2ZXJzL25ldC9ldGhl
cm5ldC9zdG1pY3JvL3N0bW1hYy9NYWtlZmlsZSAgICAgICB8ICAgMSArCiAuLi4vbmV0L2V0aGVy
bmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLWluZ2VuaWMuYyAgICB8IDM2NyArKysrKysrKysrKysr
KysrKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgMzk3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1t
YWMvZHdtYWMtaW5nZW5pYy5jCgotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
