Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 71121763B72
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jul 2023 17:43:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 081C7C6B45C;
	Wed, 26 Jul 2023 15:43:29 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 14417C6B459
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 15:43:27 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id
 46e09a7af769-6b9e946c32fso1580745a34.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 08:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690386206; x=1690991006;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=GgFvlAGeua6rkHRPoDyX/+JWDNQ8FgMvtlCof0tD8t4=;
 b=RMArvMwJxEoqM7oM+2jJtH+rbGnNw2G9JiIwJG6hsgAf9RiedtfRmXrb5dmsFNY9UW
 AHgdI1ToGQr4XBGX2YNwEmtv5r/fMatcmSO1nBwGM9M0rjGJqs/oB8fwrZff4HxAHX8B
 00OpQZz+LNjdDZed8f5qjMOvn5NoMIv2SKxlpSGhPoxO8qwnBzROvCqT3P3/dPNvVriz
 7vgjeGHAeN1fPuYC+gETeVHmnu9TCJ8DJjZW7sUZkF/SZiwACYE4VaTciKpj+evW0/2s
 GcXhRmHG9g2+TuOyiFPK9GvuynmwHs63fcWsRqItpiONgSt8c3rh9cA9DcPkAtG6RJ5b
 IzGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690386206; x=1690991006;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GgFvlAGeua6rkHRPoDyX/+JWDNQ8FgMvtlCof0tD8t4=;
 b=BRyMtINbz+0ljJXonC0cj/X7U+DYowY69bwilJB1c4tWfAKGQC5XceIA2XBurYhOYG
 YlZyYIUyxZ7GY+BLQSgslBjRII2R9BFJouepZI9a9mfWZuMVZKmHxdT7sVfVMogzOO60
 ezaEXAyNhgQ4UT55mBTkpW4CLb34djeZQULQGog/ywS0IpT6CFHYSg+ZebQ7fIB1qVsT
 aepJf411SRQawvUst3rKe5F+JGlIPJepLRivOwGIzU8EyEHn/aDz7XrHD3V2aMG4qDlL
 E8DP9I1RghM2AgAuQ7mJS6pwRtKS0/QSUXUrgPxO/jDNYl3bQLPxFy2DqeNw5GeiLp6a
 sUxA==
X-Gm-Message-State: ABy/qLaZa8b/fGi7xFxkOAUAe8TwK5xAiVOUVaos0f8TFE8wRDxNuUZ0
 RusUMXXPrfgTdAaa4QWfck0=
X-Google-Smtp-Source: APBJJlH5TY7cNT9lCf4suTEQwBH46hx7lkSTs+i74ILJmSnyjHQ/it17SRxuPKv6AOjsfdVhaVHhhA==
X-Received: by 2002:a05:6870:fba9:b0:1ba:bea1:b970 with SMTP id
 kv41-20020a056870fba900b001babea1b970mr2443328oab.5.1690386205632; 
 Wed, 26 Jul 2023 08:43:25 -0700 (PDT)
Received: from hoboy.vegasvil.org ([2601:640:8000:54:e2d5:5eff:fea5:802f])
 by smtp.gmail.com with ESMTPSA id
 fw3-20020a17090b128300b00262ca945cecsm1399094pjb.54.2023.07.26.08.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 08:43:25 -0700 (PDT)
Date: Wed, 26 Jul 2023 08:43:22 -0700
From: Richard Cochran <richardcochran@gmail.com>
To: Johannes Zink <j.zink@pengutronix.de>
Message-ID: <ZME/GjBWdodiUO+8@hoboy.vegasvil.org>
References: <20230719-stmmac_correct_mac_delay-v2-1-3366f38ee9a6@pengutronix.de>
 <20230725200606.5264b59c@kernel.org>
 <ZMCRjcRF9XqEPg/Z@hoboy.vegasvil.org>
 <09a2d767-d781-eba2-028f-a949f1128fbd@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <09a2d767-d781-eba2-028f-a949f1128fbd@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, kernel@pengutronix.de, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 kernel test robot <lkp@intel.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, patchwork-jzi@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: correct MAC propagation
	delay
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

T24gV2VkLCBKdWwgMjYsIDIwMjMgYXQgMDg6MTA6MzVBTSArMDIwMCwgSm9oYW5uZXMgWmluayB3
cm90ZToKCj4gQWxzbyBvbiBhIHNpZGUtbm90ZSwgImRyaXZlciBub25zZW5zZSIgc291bmRzIGEg
Yml0IGhhcnNoIGZyb20gc29tZW9uZQo+IGFsd2F5cyBpbnNpc3RpbmcgdGhhdCBvbmUgc2hvdWxk
IG5vdCBjb21wZW5zYXRlIGZvciBiYWQgZHJpdmVycyBpbiB0aGUKPiB1c2Vyc3BhY2Ugc3RhY2sg
YW5kIGluc3RlYWQgZml4aW5nIGRyaXZlciBhbmQgaGFyZHdhcmUgaXNzdWVzIGluIHRoZSBrZXJu
ZWwsCj4gZG9uJ3QgeW91IHRoaW5rPwoKRXZlcnl0aGluZyBoYXMgaXRzIHBsYWNlLgoKVGhlIHBy
b3BlciBwbGFjZSB0byBhY2NvdW50IGZvciBkZWxheSBhc3ltbWV0cmllcyBpcyBpbiB0aGUgdXNl
ciBzcGFjZQpjb25maWd1cmF0aW9uLCBmb3IgZXhhbXBsZSBpbiBsaW51eHB0cCB5b3UgaGF2ZQoK
ICAgICAgIGRlbGF5QXN5bW1ldHJ5CiAgICAgICAgICAgICAgVGhlICB0aW1lICBkaWZmZXJlbmNl
IGluIG5hbm9zZWNvbmRzIG9mIHRoZSB0cmFuc21pdCBhbmQgcmVjZWl2ZQogICAgICAgICAgICAg
IHBhdGhzLiBUaGlzIHZhbHVlIHNob3VsZCBiZSBwb3NpdGl2ZSB3aGVuICB0aGUgIHNlcnZlci10
by1jbGllbnQKICAgICAgICAgICAgICBwcm9wYWdhdGlvbiAgdGltZSAgaXMgIGxvbmdlciAgYW5k
ICBuZWdhdGl2ZSB3aGVuIHRoZSBjbGllbnQtdG8tCiAgICAgICAgICAgICAgc2VydmVyIHRpbWUg
aXMgbG9uZ2VyLiBUaGUgZGVmYXVsdCBpcyAwIG5hbm9zZWNvbmRzLgoKICAgICAgIGVncmVzc0xh
dGVuY3kKICAgICAgICAgICAgICBTcGVjaWZpZXMgdGhlICBkaWZmZXJlbmNlICBpbiAgbmFub3Nl
Y29uZHMgIGJldHdlZW4gIHRoZSAgYWN0dWFsCiAgICAgICAgICAgICAgdHJhbnNtaXNzaW9uIHRp
bWUgYXQgdGhlIHJlZmVyZW5jZSBwbGFuZSBhbmQgdGhlIHJlcG9ydGVkIHRyYW5z4oCQCiAgICAg
ICAgICAgICAgbWl0IHRpbWUgc3RhbXAuIFRoaXMgdmFsdWUgd2lsbCBiZSBhZGRlZCB0byBlZ3Jl
c3MgIHRpbWUgIHN0YW1wcwogICAgICAgICAgICAgIG9idGFpbmVkIGZyb20gdGhlIGhhcmR3YXJl
LiAgVGhlIGRlZmF1bHQgaXMgMC4KCiAgICAgICBpbmdyZXNzTGF0ZW5jeQogICAgICAgICAgICAg
IFNwZWNpZmllcyB0aGUgZGlmZmVyZW5jZSBpbiBuYW5vc2Vjb25kcyBiZXR3ZWVuIHRoZSByZXBv
cnRlZCByZeKAkAogICAgICAgICAgICAgIGNlaXZlICB0aW1lICBzdGFtcCAgYW5kICB0aGUgIGFj
dHVhbCByZWNlcHRpb24gdGltZSBhdCByZWZlcmVuY2UKICAgICAgICAgICAgICBwbGFuZS4gVGhp
cyB2YWx1ZSB3aWxsIGJlIHN1YnRyYWN0ZWQgZnJvbSAgaW5ncmVzcyAgdGltZSAgc3RhbXBzCiAg
ICAgICAgICAgICAgb2J0YWluZWQgZnJvbSB0aGUgaGFyZHdhcmUuICBUaGUgZGVmYXVsdCBpcyAw
LgoKVHJ5aW5nIHRvIGhhcmQgY29kZSB0aG9zZSBpbnRvIHRoZSBkcml2ZXI/ICBHb29kIGx1Y2sg
Z2V0dGluZyB0aGF0CnJpZ2h0IGZvciBldmVyeW9uZS4KCkJUVyB0aGlzIGRyaXZlciBpcyBhY3R1
YWxseSBmb3IgYW4gSVAgY29yZSB1c2VkIGluIG1hbnksIG1hbnkgU29Dcy4KCkhvdyBtYW55IF9v
dGhlcl8gU29DcyBkaWQgeW91IHRlc3QgeW91ciBwYXRjaCBvbj8KClRoYW5rcywKUmljaGFyZAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
