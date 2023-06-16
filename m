Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9708734E62
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Jun 2023 10:46:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B543C6B466;
	Mon, 19 Jun 2023 08:46:49 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B99BC6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jun 2023 10:05:39 +0000 (UTC)
X-GND-Sasl: alexis.lothore@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1686909939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rkCCowvxOYGZg7Z9wbkDB7S4cuEwrkMFzeVio1wTdXo=;
 b=NlNjR5IkiS/CJUICRXHd3Pdo1W8yas6A2Oo6pwfqiAQO+7QGvo0k3a8IM+afn5B2XKdwbr
 MtWhVmbCN5DDEioTii3QuSGjQfveVj0G0Z/sJBRwIdWmECCZuMGdr4u7V1a/ss6AhgUQMg
 PVSZdgDUpckaph1m4J6etyD8BvA1x/eynmEZTnzUq9ALTNbD5dj4Nj1H0odPELVqLvjir6
 onQGCqinFG/Wk6VozVsdDsZPNGuEzLFuZUre7dTmQ/OYkkzcVCWJZQXo7F0UoykYmDAUIE
 9xy34PWfCvDrG9OGH1DwUk2YpoiMDT6jVQHxr/OQWJXCZsE0d3ec7yOTicWFmw==
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2E0CE2000F;
 Fri, 16 Jun 2023 10:05:38 +0000 (UTC)
From: alexis.lothore@bootlin.com
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>
Date: Fri, 16 Jun 2023 12:04:08 +0200
Message-ID: <20230616100409.164583-8-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230616100409.164583-1-alexis.lothore@bootlin.com>
References: <20230616100409.164583-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 19 Jun 2023 08:46:47 +0000
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Nicolas Carrier <nicolas.carrier@nav-timing.safrangroup.com>
Subject: [Linux-stm32] [PATCH net-next 7/8] net: stmmac: do not overwrite
	other flags when writing timestamp control
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

RnJvbTogQWxleGlzIExvdGhvcsOpIDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4KCk9uIHNv
bWUgdmVyc2lvbnMgb2YgR01BQyBJUCwgZm9yIGV4YW1wbGUsIERXTUFDMTAwMCwgd2UgbWF5IG92
ZXJ3cml0ZSBzb21lCm90aGVyIGZsYWdzIGxpa2UgQVRTRU4wIHdoZW4gd3JpdGluZyBUaW1lc3Rh
bXAgQ29udHJvbCByZWdpc3Rlci4KQXZvaWQgb3ZlcndyaXRpbmcgdGhvc2UgYWRkaXRpb25hbCBm
bGFncyBieSBzZXR0aW5nIGEgcmVhZC13cml0ZS1tb2RpZnkKcHJvY2VzcyBvbmx5IG9uIGZsYWdz
IG9mIGludGVyZXN0CgpTaWduZWQtb2ZmLWJ5OiBBbGV4aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Ro
b3JlQGJvb3RsaW4uY29tPgotLS0KIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFj
L3N0bW1hY19tYWluLmMgfCA4ICsrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3Rt
aWNyby9zdG1tYWMvc3RtbWFjX21haW4uYyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8v
c3RtbWFjL3N0bW1hY19tYWluLmMKaW5kZXggNTI4ZDJlMDEwOTI2Li5iYTQ4M2FkZjRlMWEgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWlu
LmMKKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4u
YwpAQCAtNjE2LDYgKzYxNiwxMCBAQCBzdGF0aWMgdm9pZCBzdG1tYWNfZ2V0X3J4X2h3dHN0YW1w
KHN0cnVjdCBzdG1tYWNfcHJpdiAqcHJpdiwgc3RydWN0IGRtYV9kZXNjICpwLAogICovCiBzdGF0
aWMgaW50IHN0bW1hY19od3RzdGFtcF9zZXQoc3RydWN0IG5ldF9kZXZpY2UgKmRldiwgc3RydWN0
IGlmcmVxICppZnIpCiB7CisJdTMyIHJlc2V0X21hc2sgPSBQVFBfVENSX1NOQVBUWVBTRUxfMSB8
IFBUUF9UQ1JfVFNJUFY0RU5BIHwKKwkJCSBQVFBfVENSX1RTSVBWNkVOQSB8IFBUUF9UQ1JfVFNF
Vk5URU5BIHwKKwkJCSBQVFBfVENSX1RTTVNUUkVOQSB8IFBUUF9UQ1JfVFNWRVIyRU5BIHwKKwkJ
CSBQVFBfVENSX1RTSVBFTkEgfCBQVFBfVENSX1RTRU5BTEw7CiAJc3RydWN0IHN0bW1hY19wcml2
ICpwcml2ID0gbmV0ZGV2X3ByaXYoZGV2KTsKIAlzdHJ1Y3QgaHd0c3RhbXBfY29uZmlnIGNvbmZp
ZzsKIAl1MzIgcHRwX3YyID0gMDsKQEAgLTc4Myw3ICs3ODcsOSBAQCBzdGF0aWMgaW50IHN0bW1h
Y19od3RzdGFtcF9zZXQoc3RydWN0IG5ldF9kZXZpY2UgKmRldiwgc3RydWN0IGlmcmVxICppZnIp
CiAJcHJpdi0+aHd0c19yeF9lbiA9ICgoY29uZmlnLnJ4X2ZpbHRlciA9PSBIV1RTVEFNUF9GSUxU
RVJfTk9ORSkgPyAwIDogMSk7CiAJcHJpdi0+aHd0c190eF9lbiA9IGNvbmZpZy50eF90eXBlID09
IEhXVFNUQU1QX1RYX09OOwogCi0JcHJpdi0+c3lzdGltZV9mbGFncyA9IFNUTU1BQ19IV1RTX0FD
VElWRTsKKwlwcml2LT5zeXN0aW1lX2ZsYWdzID0gc3RtbWFjX2NvbmZpZ19od190c3RhbXBpbmdf
Z2V0KHByaXYsIHByaXYtPnB0cGFkZHIpOworCXByaXYtPnN5c3RpbWVfZmxhZ3MgJj0gfnJlc2V0
X21hc2s7CisJcHJpdi0+c3lzdGltZV9mbGFncyB8PSBTVE1NQUNfSFdUU19BQ1RJVkU7CiAKIAlp
ZiAocHJpdi0+aHd0c190eF9lbiB8fCBwcml2LT5od3RzX3J4X2VuKSB7CiAJCXByaXYtPnN5c3Rp
bWVfZmxhZ3MgfD0gdHN0YW1wX2FsbCB8IHB0cF92MiB8Ci0tIAoyLjQxLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
