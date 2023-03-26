Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7056C96A2
	for <lists+linux-stm32@lfdr.de>; Sun, 26 Mar 2023 18:07:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 013C5C6A5FB;
	Sun, 26 Mar 2023 16:07:27 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE903C6A5F7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Mar 2023 16:07:25 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id y4so26377304edo.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Mar 2023 09:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1679846845;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dIi+oN72WZEPUIzF4SXi/G/Glt6kbpRtp0rjNVLhNxU=;
 b=rYC+DXaM8jK8m+4KNtMsT/0cBAqMBwjPK7uRdODmDe+FpYpXt0WHXiiX9AF38CuVV4
 02Z0j2OfhQGgTKc+humC8K22N/iyMQrjCtAvFt9sWcSQ2w6sECg192pN2gdc6/J8qIOy
 xiF7hiwyMolfZwM9rGos/DV5nbG64/s9M2zSk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679846845;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dIi+oN72WZEPUIzF4SXi/G/Glt6kbpRtp0rjNVLhNxU=;
 b=YarsI521vJ02PlHWAyHW3dtmTC0QCtivXvXi+tHkPlRf1ZzZ6m3CEyVNLrVP1f7kdo
 mJIEmJr3x+uzT5KI1qSUXsIrujihk+whfgxc+LRabgr0DLVoKlQmClkEiVV23lduFSsV
 IEhP0rkNMwC49zCBumdxE9vJS+jDxLklsp6M3mJPtrpKC7aVf7gSmL4f1ON1/iymell/
 HoO71FrfUZG0amvQeyzjU7Zn0ztBQ2eGCyzRdLJF0xnC+Dvi1spWbyPxi5lu8IrP5kbP
 aga/7PNWgeiPH+GZYJKmD+Os/lsLdFHTG8DE67ixqewi2rQM7M+D6M4/Jx/GdZZYMzAt
 S5+g==
X-Gm-Message-State: AAQBX9f6pRWueZZW/nYZl/Lj82P+h5AoVuyeYWXeM/kulZyaU9ipYblm
 NJMIK4hC36TzJIDG7l3QZvpnDJl2R4/osMnxOIXNEA==
X-Google-Smtp-Source: AKy350aSHCmM5L0AkEbNo7ZMCzsEjdop5DldR1H6TrcAFOLh2mVLvg3OquHgLQZFz71CzdYZwPS0LbUPocYBiudtQeU=
X-Received: by 2002:a50:d517:0:b0:4fb:7e7a:ebf1 with SMTP id
 u23-20020a50d517000000b004fb7e7aebf1mr4267496edi.6.1679846845304; Sun, 26 Mar
 2023 09:07:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230315211040.2455855-1-dario.binacchi@amarulasolutions.com>
 <CABGWkvpHHLNzZHDMzWveoHtApmR3czVvoCOnuWBZt-UoLVU-6g@mail.gmail.com>
 <20230324155632.24chi5ndo23awhhp@pengutronix.de>
In-Reply-To: <20230324155632.24chi5ndo23awhhp@pengutronix.de>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sun, 26 Mar 2023 18:07:14 +0200
Message-ID: <CABGWkvpsza=b8GAFkyL2VMMHqkHyY4VLQ=8aky5G8vWTeAR49g@mail.gmail.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-can@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Subject: Re: [Linux-stm32] [RESEND PATCH v7 0/5] can: bxcan: add support for
	ST bxCAN controller
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

SGkgTWFyYywKCk9uIEZyaSwgTWFyIDI0LCAyMDIzIGF0IDQ6NTbigK9QTSBNYXJjIEtsZWluZS1C
dWRkZSA8bWtsQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPgo+IE9uIDIxLjAzLjIwMjMgMTI6MjU6
MTUsIERhcmlvIEJpbmFjY2hpIHdyb3RlOgo+ID4gQSBnZW50bGUgcGluZyB0byByZW1pbmQgeW91
IG9mIHRoaXMgc2VyaWVzLgo+ID4gSSBoYXZlIG5vIGlkZWEgd2h5IGl0IGhhc24ndCBkZXNlcnZl
ZCBhbnkgcmVzcG9uc2UgZm9yIHF1aXRlIHNvbWUKPiA+IHRpbWUuCj4gPiBJcyB0aGVyZSBhbnl0
aGluZyBJIGFtIHN0aWxsIG1pc3Npbmc/Cj4KPiBJIHdvbmRlciBpZiB3ZSB3YW50IHRvIGRvIGEg
cy9tYXN0ZXIvcHJpbWFyeS8gaW4gdGhlIERUIGJpbmRpbmdzIGFuZAo+IGRyaXZlcj8KClRoZSBT
VCByZWZlcmVuY2UgbWFudWFsIChSTTAzODYpIGV4cGxpY2l0bHkgdXNlcyB0aGUgbWFzdGVyIGFu
ZCBzbGF2ZSB3b3JkcwppbiB0aGUgYnhjYW4gY2hhcHRlci4gSSB3b3VsZCBzdGF5IGNvbnNpc3Rl
bnQgd2l0aCBpdC4gQnV0IEkgaGF2ZSBubyBwcm9ibGVtCmNoYW5naW5nIGl0IHRvIHByaW1hcnku
IEkganVzdCBzZW50IHY4IHdpdGggdGhlIGNoYW5nZXMgeW91IHN1Z2dlc3RlZApmb3Igc2hhcmVk
IGlycQphbmQgY2xvY2sgZW5hYmxlL2Rpc2FibGUsIGJ1dCBpZiB5b3UgcHJlZmVyIHRvIHVzZSBw
cmltYXJ5IEkgd2lsbCBzZW5kCnRoZSB2OSB2ZXJzaW9uCndpdGggdGhhdCBjaGFuZ2UuClBsZWFz
ZSBsZXQgbWUga25vdyB5b3VyIG9waW5pb24uCgpUaGFua3MgYW5kIHJlZ2FyZHMsCkRhcmlvCgo+
Cj4gcmVnYXJkcywKPiBNYXJjCj4KPiAtLQo+IFBlbmd1dHJvbml4IGUuSy4gICAgICAgICAgICAg
ICAgIHwgTWFyYyBLbGVpbmUtQnVkZGUgICAgICAgICAgIHwKPiBFbWJlZGRlZCBMaW51eCAgICAg
ICAgICAgICAgICAgICB8IGh0dHBzOi8vd3d3LnBlbmd1dHJvbml4LmRlICB8Cj4gVmVydHJldHVu
ZyBOw7xybmJlcmcgICAgICAgICAgICAgIHwgUGhvbmU6ICs0OS01MTIxLTIwNjkxNy0xMjkgIHwK
PiBBbXRzZ2VyaWNodCBIaWxkZXNoZWltLCBIUkEgMjY4NiB8IEZheDogICArNDktNTEyMS0yMDY5
MTctNTU1NSB8CgoKCi0tIAoKRGFyaW8gQmluYWNjaGkKClNlbmlvciBFbWJlZGRlZCBMaW51eCBE
ZXZlbG9wZXIKCmRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCgoKQW1hcnVsYSBTb2x1dGlvbnMgU1JMCgpWaWEgTGUg
Q2FuZXZhcmUgMzAsIDMxMTAwIFRyZXZpc28sIFZlbmV0bywgSVQKClQuICszOSAwNDIgMjQzIDUz
MTAKaW5mb0BhbWFydWxhc29sdXRpb25zLmNvbQoKd3d3LmFtYXJ1bGFzb2x1dGlvbnMuY29tCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
