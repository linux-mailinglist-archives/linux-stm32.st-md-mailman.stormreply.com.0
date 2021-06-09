Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 254883A1BE0
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Jun 2021 19:35:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB9E6C58D5B;
	Wed,  9 Jun 2021 17:35:36 +0000 (UTC)
Received: from out28-121.mail.aliyun.com (out28-121.mail.aliyun.com
 [115.124.28.121])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96E22C57B78
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Jun 2021 17:35:33 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.4296847|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.00416425-0.00125996-0.994576;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047207; MF=zhouyanjie@wanyeetech.com;
 NM=1; PH=DS; RN=20; RT=20; SR=0; TI=SMTPD_---.KQ26pE3_1623260120; 
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com
 fp:SMTPD_---.KQ26pE3_1623260120)
 by smtp.aliyun-inc.com(10.147.41.138);
 Thu, 10 Jun 2021 01:35:30 +0800
From: =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?=
 <zhouyanjie@wanyeetech.com>
To: davem@davemloft.net, kuba@kernel.org, robh+dt@kernel.org,
 peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com
Date: Thu, 10 Jun 2021 01:35:08 +0800
Message-Id: <1623260110-25842-1-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, jun.jiang@ingenic.com, sernia.zhou@foxmail.com,
 rick.tyliu@ingenic.com, netdev@vger.kernel.org, sihui.liu@ingenic.com,
 aric.pzqi@ingenic.com, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, paul@crapouillou.net, dongsheng.qiu@ingenic.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/2] Add Ingenic SoCs MAC support.
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
aGUgWDIwMDAgU29DLgoKdjEtPnYyOgoxLkZpeCB1bmluaXRpYWxpemVkIHZhcmlhYmxlLgoyLkFk
ZCBtaXNzaW5nIFJHTUlJLUlELCBSR01JSS1SWElELCBhbmQgUkdNSUktVFhJRC4KMy5DaGFuZ2Ug
dmFyaWFibGUgdmFsIGZyb20gaW50IHRvIHVuc2luZ2VkIGludC4KNC5HZXQgdHggY2xvY2sgZGVs
YXkgYW5kIHJ4IGNsb2NrIGRlbGF5IGZyb20gZGV2aWNldHJlZS4KCuWRqOeQsOadsCAoWmhvdSBZ
YW5qaWUpICgyKToKICBkdC1iaW5kaW5nczogZHdtYWM6IEFkZCBiaW5kaW5ncyBmb3IgbmV3IElu
Z2VuaWMgU29Dcy4KICBuZXQ6IHN0bW1hYzogQWRkIEluZ2VuaWMgU29DcyBNQUMgc3VwcG9ydC4K
CiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvc25wcyxkd21hYy55YW1sICAgICAgICB8ICAx
NSArCiBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9LY29uZmlnICAgICAgICB8
ICAxMiArCiBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9NYWtlZmlsZSAgICAg
ICB8ICAgMSArCiAuLi4vbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLWluZ2VuaWMu
YyAgICB8IDQzNCArKysrKysrKysrKysrKysrKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgNDYyIGlu
c2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1p
Y3JvL3N0bW1hYy9kd21hYy1pbmdlbmljLmMKCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
