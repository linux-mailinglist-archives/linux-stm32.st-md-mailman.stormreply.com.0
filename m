Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D423ADE4D
	for <lists+linux-stm32@lfdr.de>; Sun, 20 Jun 2021 14:39:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9132CC57B51;
	Sun, 20 Jun 2021 12:39:04 +0000 (UTC)
Received: from out28-121.mail.aliyun.com (out28-121.mail.aliyun.com
 [115.124.28.121])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32E6FC57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 20 Jun 2021 12:39:00 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.3372465|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0171097-0.00245908-0.980431;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047209; MF=zhouyanjie@wanyeetech.com;
 NM=1; PH=DS; RN=18; RT=18; SR=0; TI=SMTPD_---.KVAnlIH_1624192730; 
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com
 fp:SMTPD_---.KVAnlIH_1624192730)
 by smtp.aliyun-inc.com(10.147.44.129);
 Sun, 20 Jun 2021 20:38:55 +0800
From: =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?=
 <zhouyanjie@wanyeetech.com>
To: davem@davemloft.net, kuba@kernel.org, robh+dt@kernel.org,
 peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com
Date: Sun, 20 Jun 2021 20:38:48 +0800
Message-Id: <1624192730-43276-1-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, jun.jiang@ingenic.com, sernia.zhou@foxmail.com,
 rick.tyliu@ingenic.com, dongsheng.qiu@ingenic.com, sihui.liu@ingenic.com,
 aric.pzqi@ingenic.com, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/2] Fix for Ingenic MAC support.
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

MS5SZW1vdmUgdGhlIHVuZXhwZWN0ZWQgInNucHMsZHdtYWMiIGl0ZW0gaW4gdGhlIGV4YW1wbGUu
CjIuUmVtb3ZlIHVudXNlZCB2YXJpYWJsZXMgaW4gaW5nZW5pY19tYWNfc3VzcGVuZCgpIGFuZAog
IGluZ2VuaWNfbWFjX3Jlc3VtZSgpLgoK5ZGo55Cw5p2wIChaaG91IFlhbmppZSkgKDIpOgogIGR0
LWJpbmRpbmdzOiBkd21hYzogUmVtb3ZlIHVuZXhwZWN0ZWQgaXRlbS4KICBuZXQ6IHN0bW1hYzog
SW5nZW5pYzogUmVtb3ZlIHVudXNlZCB2YXJpYWJsZXMuCgogRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL25ldC9pbmdlbmljLG1hYy55YW1sIHwgMiArLQogZHJpdmVycy9uZXQvZXRo
ZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtaW5nZW5pYy5jICAgIHwgNCAtLS0tCiAyIGZpbGVz
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA1IGRlbGV0aW9ucygtKQoKLS0gCjIuNy40CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
