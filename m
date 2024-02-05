Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAAD8495F1
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Feb 2024 10:07:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C41ACC71284;
	Mon,  5 Feb 2024 09:07:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8D0D6C6C858
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Feb 2024 09:07:35 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4158QGPd010843; Mon, 5 Feb 2024 10:06:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:date:subject:mime-version:content-type
 :content-transfer-encoding:message-id:references:in-reply-to:to
 :cc; s=selector1; bh=0b38tedRyxz1wugMy9qAGe9nstQPcZ6cdawHN0/CbEE
 =; b=ha4lGeLJMAyMUexImqMbKQl4r/g+pV2RPCto7FtbIm7bY/+I+gTfoBzFxou
 B84aZqtcQRYeUMCKhEMqygX7Tz0y0ZcVS+GePA7QAh8rZskYVSXbzOIkMMrD6GyP
 1gHEmuKevzlVJWbEj+JD8eMKNPdHy4KFLHJeFNkeG5SMCNsBiFTlT9ZxFML3mbS7
 8sXLuiGnEzPYdikHQM6TmUi3yCKlhB8ewKeVWPwUr2FdG25xKj8ZunzGydk5KXxe
 yscM6vY76+d22E6928GZ8Zq9NArm4ADTKoNONZJUKffpZCwK6klXGsMkWJ17Vhdt
 lBTYzDg4eJIBQzx9uLNRn+FPZFw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3w1eyp60u0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Feb 2024 10:06:56 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C02E010003B;
 Mon,  5 Feb 2024 10:06:53 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AB8CB29E60A;
 Mon,  5 Feb 2024 10:06:53 +0100 (CET)
Received: from localhost (10.252.18.216) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 5 Feb
 2024 10:06:53 +0100
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Mon, 5 Feb 2024 10:06:51 +0100
MIME-Version: 1.0
Message-ID: <20240205-ltdc_mp13-v1-1-072d24bf1b36@foss.st.com>
References: <20240205-ltdc_mp13-v1-0-072d24bf1b36@foss.st.com>
In-Reply-To: <20240205-ltdc_mp13-v1-0-072d24bf1b36@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.4
X-Originating-IP: [10.252.18.216]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-05_04,2024-01-31_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, Yannick Fertre <yannick.fertre@foss.st.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/5] ARM: dts: stm32: add LTDC support for
 STM32MP13x SoC family
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

U1RNMzJNUDEzeCBTb0MgZmFtaWx5IGVtYmVkcyBhIG5ldyB2ZXJzaW9uIG9mIExUREMgKExpcXVp
ZCBjcnlzdGFsCmRpc3BsYXkgLSBUaGluIGZpbG0gdHJhbnNpc3RvcikgRGlzcGxheSBDb250cm9s
bGVyLgoKSXQgcHJvdmlkZXMgYSBwYXJhbGxlbCBkaWdpdGFsIFJHQiAocmVkLCBncmVlbiwgYmx1
ZSkgYW5kIHNpZ25hbHMgZm9yCmhvcml6b250YWwsIHZlcnRpY2FsIHN5bmNocm9uaXphdGlvbiwg
cGl4ZWwgY2xvY2sgYW5kIGRhdGEgZW5hYmxlIGFzCm91dHB1dCB0byBpbnRlcmZhY2UgZGlyZWN0
bHkgdG8gYSB2YXJpZXR5IG9mIExDRC1URlQgcGFuZWxzLgoKTWFpbiBmZWF0dXJlcwogICogMiBp
bnB1dCBsYXllcnMgYmxlbmRlZCB0b2dldGhlciB0byBjb21wb3NlIHRoZSBkaXNwbGF5CiAgKiBD
cm9wcGluZyBvZiBsYXllcnMgZnJvbSBhbnkgaW5wdXQgc2l6ZSBhbmQgbG9jYXRpb24KICAqIE11
bHRpcGxlIGlucHV0IHBpeGVsIGZvcm1hdHM6CiAgICDigJMgUHJlZGVmaW5lZCBBUkdCLCB3aXRo
IDcgZm9ybWF0czogQVJHQjg4ODgsIEFCR1I4ODg4LCBSR0JBODg4OCwKICAgIEJHUkE4ODg4LCBS
R0I1NjUsIEJHUjU2NSwgUkdCODg4cGFja2VkLgogICAg4oCTIEZsZXhpYmxlIEFSR0IsIGFsbG93
aW5nIGFueSB3aWR0aCBhbmQgbG9jYXRpb24gZm9yIEEsUixHLEIKICAgIGNvbXBvbmVudHMuCiAg
ICDigJMgUHJlZGVmaW5lZCBZVVYsIHdpdGggMyBmb3JtYXRzOiBZVVY0MjItMUwgKEZvdXJDQzog
WVVZViwKICAgIEludGVybGVhdmVkKSwgWVVWNDIwLTJMIChGb3VyQ0M6IE5WMTIsIHNlbWkgcGxh
bmFyKSwgWVVWNDIwLTNMCiAgICAoRm91ckNDOiBZeHgsIGZ1bGwgcGxhbmFyKSB3aXRoIHNvbWUg
ZmxleGliaWxpdHkgb24gdGhlIHNlcXVlbmNlIG9mCiAgICB0aGUgY29tcG9uZW50LgogICogQ29s
b3IgbG9vay11cCB0YWJsZSAoQ0xVVCkgdXAgdG8gMjU2IGNvbG9ycyAoMjU2eDI0IGJpdHMpIHBl
ciBsYXllcgogICogQ29sb3IgdHJhbnNwYXJlbmN5IGtleWluZwogICogQ29tcG9zaXRpb24gd2l0
aCBmbGV4aWJsZSB3aW5kb3cgcG9zaXRpb24gYW5kIHNpemUgdmVyc3VzIG91dHB1dAogIGRpc3Bs
YXkKICAqIEJsZW5kaW5nIHdpdGggZmxleGlibGUgbGF5ZXIgb3JkZXIgYW5kIGFscGhhIHZhbHVl
IChwZXIgcGl4ZWwgb3IKICBjb25zdGFudCkKICAqIEJhY2tncm91bmQgdW5kZXJseWluZyBjb2xv
cgogICogR2FtbWEgd2l0aCBub24tbGluZWFyIGNvbmZpZ3VyYWJsZSB0YWJsZQogICogRGl0aGVy
aW5nIGZvciBvdXRwdXQgd2l0aCBsZXNzIGJpdHMgcGVyIGNvbXBvbmVudCAocHNldWRvLXJhbmRv
bSBvbgogIDIgYml0cykKICAqIFBvbGFyaXR5IGludmVyc2lvbiBmb3IgSFN5bmMsIFZTeW5jLCBh
bmQgRGF0YUVuYWJsZSBvdXRwdXRzCiAgKiBPdXRwdXQgYXMgUkdCODg4IDI0IGJwcCBvciBZVVY0
MjIgMTYgYnBwCiAgKiBTZWN1cmUgbGF5ZXIgKHVzaW5nIExheWVyMikgY2FwYWJpbGl0eSwgd2l0
aCBncm91cGVkIHJlZ3MgYW5kCiAgYWRkaXRpb25hbCBpbnRlcnJ1cHQgc2V0CiAgKiBJbnRlcnJ1
cHRzIGJhc2VkIG9uIDcgZGlmZmVyZW50IGV2ZW50cwogICogQVhJIG1hc3RlciBpbnRlcmZhY2Ug
d2l0aCBsb25nIGVmZmljaWVudCBidXJzdHMgKDY0IG9yIDEyOCBieXRlcykKClNpZ25lZC1vZmYt
Ynk6IFJhcGhhZWwgR2FsbGFpcy1Qb3UgPHJhcGhhZWwuZ2FsbGFpcy1wb3VAZm9zcy5zdC5jb20+
ClNpZ25lZC1vZmYtYnk6IFlhbm5pY2sgRmVydHJlIDx5YW5uaWNrLmZlcnRyZUBmb3NzLnN0LmNv
bT4KLS0tCiBhcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTM1LmR0c2kgfCAxMSArKysrKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNo
L2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTM1LmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9zdC9z
dG0zMm1wMTM1LmR0c2kKaW5kZXggNjhkMzJmOWY1MzE0Li44MzRhNGQ1NDVmZTQgMTAwNjQ0Ci0t
LSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxMzUuZHRzaQorKysgYi9hcmNoL2FybS9i
b290L2R0cy9zdC9zdG0zMm1wMTM1LmR0c2kKQEAgLTE5LDUgKzE5LDE2IEBAIGRjbWlwcDogZGNt
aXBwQDVhMDAwMDAwIHsKIAkJCXBvcnQgewogCQkJfTsKIAkJfTsKKworCQlsdGRjOiBkaXNwbGF5
LWNvbnRyb2xsZXJANWEwMDEwMDAgeworCQkJY29tcGF0aWJsZSA9ICJzdCxzdG0zMi1sdGRjIjsK
KwkJCXJlZyA9IDwweDVhMDAxMDAwIDB4NDAwPjsKKwkJCWludGVycnVwdHMgPSA8R0lDX1NQSSA4
OCBJUlFfVFlQRV9MRVZFTF9ISUdIPiwKKwkJCQkgICAgIDxHSUNfU1BJIDg5IElSUV9UWVBFX0xF
VkVMX0hJR0g+OworCQkJY2xvY2tzID0gPCZyY2MgTFREQ19QWD47CisJCQljbG9jay1uYW1lcyA9
ICJsY2QiOworCQkJcmVzZXRzID0gPCZzY21pX3Jlc2V0IFJTVF9TQ01JX0xUREM+OworCQkJc3Rh
dHVzID0gImRpc2FibGVkIjsKKwkJfTsKIAl9OwogfTsKCi0tIAoyLjI1LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
