Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B376BC6F316
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Nov 2025 15:17:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63A8EC56611;
	Wed, 19 Nov 2025 14:17:01 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3CD41C1A97F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Nov 2025 14:17:00 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-59578e38613so7414936e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Nov 2025 06:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763561819; x=1764166619;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=awKddCc3yTAuC3bB9cWOYHXwvySxzKFc6nPBtbPY9B0=;
 b=s7P8QxH1rWHpRmgGe1xwLgH6d6kp4rU7qpeWJ2TMGpvN56s1qx4l28mU2SI1y/33/Z
 /hJkaDwx8dQywDCKmgYucqLXK/wbzJK8IyHmfn81RNLSCxSIjSgODpcqXUqgwXkcqqgC
 DWu5SIlh350jTFMLqSRK0eLRrWxkGnUgAlCuoUEZVuqwUnoxM+S/S5lRuqZSWeMYHXCy
 fqX+TFphgMklfFK56myUGiAr9eXF64atIWiETK05XKqwcyuXqjxb0NYmw11EPqpOEnSj
 /VELGU4A38A9S7unsqTPQ3/2NGPKX+fJzddZVHVmDX+0i5SHmm2s7i4q93HBiN06hTCv
 YfZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763561819; x=1764166619;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=awKddCc3yTAuC3bB9cWOYHXwvySxzKFc6nPBtbPY9B0=;
 b=RgfRNaKy7A+vzwgm4Yh1E4z7wvj+a5Ko5K5guE7ll67u67FlDRi0iJnyeA2Gdk7pyy
 EgmLbUIXbwCKffY0VspzQWtJIULJKdXXj9Jr9WSEiJU/xxrJQYiX/g4JYhctE7GTAmGm
 cpjcnzEgrhnDkDgvqKmjOlHL2gOh/U4xzwSpOMR+tVLSS3Q+hrtLcxmjPaQhbJABjL02
 IYwBc7bETntde9QRvLHfkRtbFl2aXJbsyR7EdusoMjO5XzgbFntLJeNI+/pQRtI0MAIV
 /UA/cXzhdGj97C8IZp8XRpFzktbHukk/F2qkvfeS80xC7gbTsO+oYn6H6RSKg7LPTK0a
 ciYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXKtCB1V5UekhEhNLvWAVuB8qILOdAKAPOMKXoULl0LbYEENZLE9+2JumF/yofRI5l1KIwLnA3XdYXoA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwQoR+pAXaBxwu686pCag33RNhgVKCnPAgOC/3VRLgWmvl2ruLs
 tMQq83I2Y7sNMwJZiYuy1S6OWUCTAMGoRl/9piGj8pqXDRh29/HcQBAq7iRe3/NdqCvHFXzlkDn
 4pWJaevbPSjcHqi5WGlB+TuKf//gO00p8OehHdyB2ZQ==
X-Gm-Gg: ASbGncs3zBD6uFyLfNlNEaECu8MIWSBsHFLeqWpPN+sZ9HypVGsqJKmrMv1fkJIfnVZ
 wmmZHQXFLxEJb6knTzv0bhzmEm2CKV8tfVidVOLE8CdY+U2yG5mBAgDrlXAIp9uY0LSfiRCICr9
 p1YEOgeREawmJuUlzdI9L5GSZaNWWHiMJ77IbM+G81x6NwuxckiG2fLjfcVHF/kv4FaJumpgTtg
 sNpFjz7C7A8LjhYDqzAApz4P7s4ETdla/BHLiaq0KZGneG2fo/N4NB4i5EwCp1H87WHfOA=
X-Google-Smtp-Source: AGHT+IGairnJxnYRKkuHYVw0JVrBsc+2FMWfccI9lHotg2DPX4sHJAgyu5upYOPaMi5aXgvof+7aycNKLZqXk7xQ9eo=
X-Received: by 2002:a05:6512:230a:b0:595:7dff:ebb1 with SMTP id
 2adb3069b0e04-595841fa4d7mr5909063e87.36.1763561819191; Wed, 19 Nov 2025
 06:16:59 -0800 (PST)
MIME-Version: 1.0
References: <20251118161936.1085477-1-antonio.borneo@foss.st.com>
 <20251118161936.1085477-3-antonio.borneo@foss.st.com>
In-Reply-To: <20251118161936.1085477-3-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Nov 2025 15:16:47 +0100
X-Gm-Features: AWmQ_bn95RYU3PYx77I_yIH51aH6sidmJ5f83D5VEpU-6oaLBlEbr7SStcwerBw
Message-ID: <CACRpkdYuRas_jgi5K9hbxtJLrxxQ+wS-dJcunT5m48qS0tKXAA@mail.gmail.com>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Pascal Paillet <p.paillet@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 02/15] dt-bindings: pinctrl: stm32: use
 strings for enum property 'st, package'
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

T24gVHVlLCBOb3YgMTgsIDIwMjUgYXQgNToyMOKAr1BNIEFudG9uaW8gQm9ybmVvCjxhbnRvbmlv
LmJvcm5lb0Bmb3NzLnN0LmNvbT4gd3JvdGU6Cgo+IFRoZSBwcm9wZXJ0eSAnc3QscGFja2FnZScg
cmVwb3J0cyB0aGUgU29DIHBhY2thZ2UgdXNlZCBpbiB0aGUKPiBib2FyZCBEVCBhbmQgaXMgdXNl
ZCB0byBpbmZvcm0gdGhlIGRyaXZlciBhYm91dCB3aGljaCBwaW5zIGFyZQo+IGF2YWlsYWJsZSBm
b3IgdXNlIGJ5IHRoZSBwaW5jdHJsIGRyaXZlci4KPiBJdCBoYXMgaGlzdG9yaWNhbGx5IGJlZW4g
ZGVjbGFyZWQgYXMgYW4gdWludDMyIGVudW0sIHdoZXJlIGVhY2gKPiB2YWx1ZSBpcyBhIHBvd2Vy
IG9mIDIuCj4KPiBEZXByZWNhdGUgdGhlIHVzZSBvZiB0aGUgbnVtZXJpYyB2YWx1ZSBhbmQgcmVw
bGFjZSBpdCB3aXRoIG1vcmUKPiByZWFkYWJsZSBzdHJpbmcgdmFsdWVzLgo+Cj4gU2lnbmVkLW9m
Zi1ieTogQW50b25pbyBCb3JuZW8gPGFudG9uaW8uYm9ybmVvQGZvc3Muc3QuY29tPgoKSSB0aGlu
ayBLcnp5c3p0b2YgaXMgcmlnaHQgYWJvdXQgdGhpcywgZGVwcmVjYXRlIHRoZSBwcm9wZXJ0eSBh
bmQKKHJlLSlpbnRyb2R1Y2UgaXQgb24gdGhlIHRvcCBsZXZlbCBpbjoKRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9zdG0zMi9zdG0zMi55YW1sCgpJdCBtYXkgYmUgYSBiaXQg
cXVpcmt5IHRvIGdldCB0byB0aGlzIHByb3BlcnR5IGZyb20gdGhlIHBpbiBjb250cm9sCkxpbnV4
IGRyaXZlciwgYnV0IGl0IGlzIHRoZSByaWdodCB0aGluZyB0byBkby4KClRoZSBWZXhwcmVzcyBo
YXMgc29tZSBpbnNwaXJhdGlvbmFsIHRvcC1sZXZlbCBjdXN0b20gcHJvcGVydGllczoKRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hcm0sdmV4cHJlc3MtanVuby55YW1sCgpZ
b3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
