Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 298C447E42E
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Dec 2021 14:42:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8B04C5F1F7;
	Thu, 23 Dec 2021 13:42:36 +0000 (UTC)
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39E7DC5F1F5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Dec 2021 13:42:35 +0000 (UTC)
Date: Thu, 23 Dec 2021 13:42:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1640266953;
 bh=KcpuETzMNMdxDT2q0V4AwCRe4eDh3KXENxpCUjqyk4Q=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc;
 b=P1Q1DQglL3/H+NbZPwD5FQ5BU9Uxk6pxEJUlWRgkAN0OLEHRoQXT9P6vmQVgI4Shq
 qswBkVMsLvmRRHD/3SjdYOuBD/GGsV6atIzIAPtvsIcihzg+XQOhNKJ4S5zw4d90GD
 yw00fU5YY0aXBm/7z9QW1y6keFUYtpbhm6KU5cycwBKvr1TY5EinTkhSnF0bxps/kb
 vJWQQ7wnICVOxl/imolN69xOrpDSgPFAomrww24G1XS9mkDEk/KWt9aiTZ7c6IFz9B
 aSiRxt4r6e7O5KrjN0k2a+YJ9Dp9EVAP0/Mu3FzFpyLIEkg43paDmTiPHdA5LXgzCF
 ZLdjYyzNmAUHg==
To: =?utf-8?Q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
From: Simon Ser <contact@emersion.fr>
Message-ID: <PIq2EEI7giz2rOuv2cfySbdxwht8AaCye140X5C7NejjXT6kD67E3E28uvg4Ebhob12EJUBtAxGPFNOgZwSWLYEfMtdhRNt3mR8bBGBJmU4=@emersion.fr>
In-Reply-To: <YcRkB7uWyt4EbcZm@intel.com>
References: <20211222090552.25972-1-jose.exposito89@gmail.com>
 <20211222090552.25972-2-jose.exposito89@gmail.com>
 <YcRkB7uWyt4EbcZm@intel.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
Cc: marex@denx.de, mcoquelin.stm32@gmail.com, s.hauer@pengutronix.de,
 tzimmermann@suse.de, kernel@pengutronix.de, airlied@linux.ie,
 intel-gfx@lists.freedesktop.org, alexandre.torgue@foss.st.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 yannick.fertre@foss.st.com, linux-imx@nxp.com, benjamin.gaignard@linaro.org,
 rodrigo.vivi@intel.com, dmitry.baryshkov@linaro.org,
 =?utf-8?Q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 shawnguo@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32]
	=?utf-8?q?=5BPATCH_v2_1/6=5D_drm/plane=3A_Make_form?=
	=?utf-8?q?at=5Fmod=5Fsupported_truly=C2=A0optional?=
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
Reply-To: Simon Ser <contact@emersion.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gVGh1cnNkYXksIERlY2VtYmVyIDIzcmQsIDIwMjEgYXQgMTI6NTYsIFZpbGxlIFN5cmrDpGzD
pCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+IHdyb3RlOgoKPiA+IC0JLyogSWYgd2Ug
Y2FuJ3QgZGV0ZXJtaW5lIHN1cHBvcnQsIGp1c3QgYmFpbCAqLwo+ID4gLQlpZiAoIXBsYW5lLT5m
dW5jcy0+Zm9ybWF0X21vZF9zdXBwb3J0ZWQpCj4gPiAtCQlnb3RvIGRvbmU7Cj4gPiAtCj4gPiAg
CW1vZCA9IG1vZGlmaWVyc19wdHIoYmxvYl9kYXRhKTsKPiA+ICAJZm9yIChpID0gMDsgaSA8IHBs
YW5lLT5tb2RpZmllcl9jb3VudDsgaSsrKSB7Cj4gPiAgCQlmb3IgKGogPSAwOyBqIDwgcGxhbmUt
PmZvcm1hdF9jb3VudDsgaisrKSB7Cj4gPiAtCQkJaWYgKHBsYW5lLT5mdW5jcy0+Zm9ybWF0X21v
ZF9zdXBwb3J0ZWQocGxhbmUsCj4gPiArCQkJaWYgKCFwbGFuZS0+ZnVuY3MtPmZvcm1hdF9tb2Rf
c3VwcG9ydGVkIHx8Cj4gPiArCQkJICAgIHBsYW5lLT5mdW5jcy0+Zm9ybWF0X21vZF9zdXBwb3J0
ZWQocGxhbmUsCj4gPiAgCQkJCQkJCSAgICAgICBwbGFuZS0+Zm9ybWF0X3R5cGVzW2pdLAo+ID4g
IAkJCQkJCQkgICAgICAgcGxhbmUtPm1vZGlmaWVyc1tpXSkpIHsKPgo+IFNvIGluc3RlYWQgb2Yg
c2tpcHBpbmcgdGhlIHdob2xlIGxvb3AgeW91IGp1c3Qgc2tpcCBkb2luZyBhbnl0aGluZwo+IGlu
c2lkZSB0aGUgbG9vcD8gQ2FuJ3Qgc2VlIGhvdyB0aGF0IGFjaGlldmVzIGFueXRoaW5nIGF0IGFs
bC4KCk5vLCB0aGUgY2hlY2sgaXMgc2tpcHBlZCB3aGVuIHRoZSBmdW5jdGlvbiBpc24ndCBwb3B1
bGF0ZWQgYnkgdGhlIGRyaXZlci4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
