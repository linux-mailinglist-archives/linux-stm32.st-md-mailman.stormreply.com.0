Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 86555858EEF
	for <lists+linux-stm32@lfdr.de>; Sat, 17 Feb 2024 12:04:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D733C69066;
	Sat, 17 Feb 2024 11:04:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1577BCFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 17 Feb 2024 11:04:53 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41H4i21O002134; Sat, 17 Feb 2024 12:04:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:date:subject:mime-version:content-type
 :content-transfer-encoding:message-id:references:in-reply-to:to
 :cc; s=selector1; bh=Dn4f3GfvCGhg9NuA1T7NEVx1XeeRBh/2a8fH4stLPtw
 =; b=OfEjebqQKJ61lO07Whpqw6TWtP86iH9Op84v6ynnWGlB7qA0qR5/pt7dyXQ
 b5pV2Q00EuHR1mfSkhoGPlcJAGl6buVfYBsCCfh1TwTiiIcht2/yfS+PrW4bphGt
 wr6Ox0qN78KX0meXJ9qFGiMlZh3OqeBP6Y4IkmRgmaJ6ZfRIzn82t8OiF+YylQNI
 MQjOGNuUZsgVd9mAkpAwDcfZgAVz+lJVzqQSas0UcIyui7Ket0lW6/BH8FGWBgUr
 qbrNkKdJSPVs3yEUN62YuUUJKqIUqYf9bMofvk2Yjkt6WeKHUeCxq6G9NpPoQh6E
 0Pjq7+0wl9nUwaJ7TcIvVbv1g8g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3wa124mx7c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 17 Feb 2024 12:04:21 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A7B4140045;
 Sat, 17 Feb 2024 12:04:14 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 09103253B46;
 Sat, 17 Feb 2024 12:03:12 +0100 (CET)
Received: from localhost (10.252.12.210) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sat, 17 Feb
 2024 12:03:11 +0100
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Sat, 17 Feb 2024 12:02:57 +0100
MIME-Version: 1.0
Message-ID: <20240217-ltdc_mp13-v2-3-50881f1b394e@foss.st.com>
References: <20240217-ltdc_mp13-v2-0-50881f1b394e@foss.st.com>
In-Reply-To: <20240217-ltdc_mp13-v2-0-50881f1b394e@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.4
X-Originating-IP: [10.252.12.210]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-17_07,2024-02-16_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 3/4] ARM: dts: stm32: enable display
 support on stm32mp135f-dk board
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

TGluayBwYW5lbCBhbmQgZGlzcGxheSBjb250cm9sbGVyLgpFbmFibGUgcGFuZWwsIGJhY2tsaWdo
dCBhbmQgZGlzcGxheSBjb250cm9sbGVyLgoKU2lnbmVkLW9mZi1ieTogUmFwaGFlbCBHYWxsYWlz
LVBvdSA8cmFwaGFlbC5nYWxsYWlzLXBvdUBmb3NzLnN0LmNvbT4KCi0tLQpDaGFuZ2VzIGluIHYy
OgogIC0gRml4ZWQgZHRic19jaGVjayB3YXJuaW5ncyA6CmFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0
bTMybXAxMzVmLWRrLmR0YjogcGFuZWwtYmFja2xpZ2h0OiAnZGVmYXVsdC1icmlnaHRuZXNzLWxl
dmVsJyBkb2VzIG5vdCBtYXRjaCBhbnkgb2YgdGhlIHJlZ2V4ZXM6ICdwaW5jdHJsLVswLTldKycK
4oCD4oCDZnJvbSBzY2hlbWEgJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9sZWRz
L2JhY2tsaWdodC9ncGlvLWJhY2tsaWdodC55YW1sIwphcmNoL2FybS9ib290L2R0cy9zdC9zdG0z
Mm1wMTM1Zi1kay5kdGI6IHBhbmVsLXJnYjogZGF0YS1tYXBwaW5nOjA6ICdiZ3I2NjYnIGlzIG5v
dCBvbmUgb2YgWydqZWlkYS0xOCcsICdqZWlkYS0yNCcsICd2ZXNhLTI0J10K4oCD4oCDZnJvbSBz
Y2hlbWEgJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9kaXNwbGF5L3BhbmVsL3Bh
bmVsLXNpbXBsZS55YW1sIwphcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTM1Zi1kay5kdGI6
IHBhbmVsLXJnYjogY29tcGF0aWJsZTogWydyb2NrdGVjaCxyazA0M2ZuNDhoJywgJ3BhbmVsLWRw
aSddIGlzIHRvbyBsb25nCuKAg+KAg2Zyb20gc2NoZW1hICRpZDogaHR0cDovL2RldmljZXRyZWUu
b3JnL3NjaGVtYXMvZGlzcGxheS9wYW5lbC9wYW5lbC1zaW1wbGUueWFtbCMKYXJjaC9hcm0vYm9v
dC9kdHMvc3Qvc3RtMzJtcDEzNWYtZGsuZHRiOiBwYW5lbC1yZ2I6IGRhdGEtbWFwcGluZzogRmFs
c2Ugc2NoZW1hIGRvZXMgbm90IGFsbG93IFsnYmdyNjY2J10K4oCD4oCDZnJvbSBzY2hlbWEgJGlk
OiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9kaXNwbGF5L3BhbmVsL3BhbmVsLXNpbXBs
ZS55YW1sIwotLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxMzVmLWRrLmR0cyB8IDUz
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDUzIGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTM1
Zi1kay5kdHMgYi9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTM1Zi1kay5kdHMKaW5kZXgg
ZWVhNzQwZDA5N2M3Li5jOTE4ZjMzMmNiZmQgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRz
L3N0L3N0bTMybXAxMzVmLWRrLmR0cworKysgYi9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1w
MTM1Zi1kay5kdHMKQEAgLTY2LDYgKzY2LDQ2IEBAIGxlZC1ibHVlIHsKIAkJCWRlZmF1bHQtc3Rh
dGUgPSAib2ZmIjsKIAkJfTsKIAl9OworCisJcGFuZWxfYmFja2xpZ2h0OiBwYW5lbC1iYWNrbGln
aHQgeworCQljb21wYXRpYmxlID0gImdwaW8tYmFja2xpZ2h0IjsKKwkJZ3Bpb3MgPSA8JmdwaW9l
IDEyIEdQSU9fQUNUSVZFX0hJR0g+OworCQlkZWZhdWx0LW9uOworCQlzdGF0dXMgPSAib2theSI7
CisJfTsKKworCXBhbmVsX3JnYjogcGFuZWwtcmdiIHsKKwkJY29tcGF0aWJsZSA9ICJyb2NrdGVj
aCxyazA0M2ZuNDhoIjsKKwkJZW5hYmxlLWdwaW9zID0gPCZncGlvaSA3IEdQSU9fQUNUSVZFX0hJ
R0g+OworCQliYWNrbGlnaHQgPSA8JnBhbmVsX2JhY2tsaWdodD47CisJCXBvd2VyLXN1cHBseSA9
IDwmc2NtaV92M3YzX3N3PjsKKwkJc3RhdHVzID0gIm9rYXkiOworCisJCXdpZHRoLW1tID0gPDEw
NT47CisJCWhlaWdodC1tbSA9IDw2Nz47CisKKwkJcGFuZWwtdGltaW5nIHsKKwkJCWNsb2NrLWZy
ZXF1ZW5jeSA9IDwxMDAwMDAwMD47CisJCQloYWN0aXZlID0gPDQ4MD47CisJCQloYmFjay1wb3Jj
aCA9IDw0Mz47CisJCQloZnJvbnQtcG9yY2ggPSA8MTA+OworCQkJaHN5bmMtbGVuID0gPDE+Owor
CQkJaHN5bmMtYWN0aXZlID0gPDA+OworCQkJdmFjdGl2ZSA9IDwyNzI+OworCQkJdmJhY2stcG9y
Y2ggPSA8MjY+OworCQkJdmZyb250LXBvcmNoID0gPDQ+OworCQkJdnN5bmMtbGVuID0gPDEwPjsK
KwkJCXZzeW5jLWFjdGl2ZSA9IDwwPjsKKwkJCWRlLWFjdGl2ZSA9IDwxPjsKKwkJCXBpeGVsY2xr
LWFjdGl2ZSA9IDwxPjsKKwkJfTsKKworCQlwb3J0IHsKKwkJCXBhbmVsX2luX3JnYjogZW5kcG9p
bnQgeworCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmbHRkY19vdXRfcmdiPjsKKwkJCX07CisJCX07
CisJfTsKIH07CiAKICZhZGNfMSB7CkBAIC0xNjAsNiArMjAwLDE5IEBAICZpd2RnMiB7CiAJc3Rh
dHVzID0gIm9rYXkiOwogfTsKIAorJmx0ZGMgeworCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCIs
ICJzbGVlcCI7CisJcGluY3RybC0wID0gPCZsdGRjX3BpbnNfYT47CisJcGluY3RybC0xID0gPCZs
dGRjX3NsZWVwX3BpbnNfYT47CisJc3RhdHVzID0gIm9rYXkiOworCisJcG9ydCB7CisJCWx0ZGNf
b3V0X3JnYjogZW5kcG9pbnQgeworCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZwYW5lbF9pbl9yZ2I+
OworCQl9OworCX07Cit9OworCiAmcnRjIHsKIAlzdGF0dXMgPSAib2theSI7CiB9OwoKLS0gCjIu
MjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
