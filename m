Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA78E8A684D
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Apr 2024 12:27:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D6EDC6B47E;
	Tue, 16 Apr 2024 10:27:36 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CCD31C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Apr 2024 10:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713263254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=jMpD+iqIk7sAa1/rHFlDW/A5fWkcr8iBWlFV+lTM674=;
 b=EQcSnfQNYZWnKXWk390lgvdjI5/rtKO1yktNlpZWR+3QIcOEg1HjuRXErwEvEXAd6EJp1i
 dN7/DfYmDl24zLcmWo5+N0PtlgXWdbF1j+FMyLv3lq9HAGz+BFgUWVqdjbIna8rvvCZejT
 OEosUB57mxZygtdwmbKc4T8RnV1jooM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-L5rHm99ONuOsGGd5sAOCZg-1; Tue, 16 Apr 2024 06:27:33 -0400
X-MC-Unique: L5rHm99ONuOsGGd5sAOCZg-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-343b9425ed1so927762f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Apr 2024 03:27:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713263252; x=1713868052;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jMpD+iqIk7sAa1/rHFlDW/A5fWkcr8iBWlFV+lTM674=;
 b=lERQ5olmAW7QDn/g/lOYlxO0rjZuNrNG1FkkneOuYUZv3fOBw/yUymUMxAAaKvonmW
 uYd3HjnkgPYNaVpPWZkUwwuVn6k16KNEdrmBEWjWNDBRdJhrU8sBDc3Zbu4Wq8bWLilO
 mXwzljS58RHJRKJDe/BEPNF9WJ3ZstvAudGwfIoRkrce4eE1hW8+th7z37INecDSSZuN
 IIuj09mvyvQzklJuCreLYX+MoDBtOVylDmE1xSmPx1r7yI502ETIq4ZYvN4Ccz7KC9Wl
 LQcWIt1Chl67DiEdVT3Zf++o49ABR2S3+/hhl6X7zrxukhwkAwrynIgvyw4d01urCwsp
 P9Zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOlyWW7A0cCeinjz9sXskhPzkiDzwUwcHOLMom6qT3Qw0bWDW6mXgFT2yeCtoujgMx98MjOKNzdo29b1PjUvCSFcYTMDIhtbDtF8Id2MoimULj3Jmcdf+m
X-Gm-Message-State: AOJu0YyPGny1XCjiwuZRRcTRmdopDFmW0HNSQosWBKv75WTnpPqbQ/o5
 HTXUcKzgNwAfJRAcEtWM98hOnyDQdNFD8qvjU5OMkvMz51y/Y4+syG1dMPgCGcaRBE7jgI7HjTr
 QCvhN47ibZgmF/g8s/misJcOV56GG3Cpgwo774Qh8rUmfgmOxZyRmhuei19eSmMfk7bHtqYPJ0g
 nCSQ==
X-Received: by 2002:a05:600c:3556:b0:418:3cf7:7f7b with SMTP id
 i22-20020a05600c355600b004183cf77f7bmr5227106wmq.3.1713263252111; 
 Tue, 16 Apr 2024 03:27:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFmIW53wsJsfJZC/vP6rHZszIiJj2G/P1JWmKG8lyXcE3DKFIYdVt+Ue4BVg0M23mZHLeZ3g==
X-Received: by 2002:a05:600c:3556:b0:418:3cf7:7f7b with SMTP id
 i22-20020a05600c355600b004183cf77f7bmr5227078wmq.3.1713263251734; 
 Tue, 16 Apr 2024 03:27:31 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-231-31.dyn.eolo.it.
 [146.241.231.31]) by smtp.gmail.com with ESMTPSA id
 q12-20020a05600c46cc00b00416e2c8b290sm22581975wmo.1.2024.04.16.03.27.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 03:27:31 -0700 (PDT)
Message-ID: <9644a96d17152014c8e7f91e9786dde26f67d7a5.camel@redhat.com>
From: Paolo Abeni <pabeni@redhat.com>
To: Serge Semin <fancer.lancer@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>,  Russell King <linux@armlinux.org.uk>, Yanteng
 Si <siyanteng@loongson.cn>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Tue, 16 Apr 2024 12:27:29 +0200
In-Reply-To: <20240412180340.7965-5-fancer.lancer@gmail.com>
References: <20240412180340.7965-1-fancer.lancer@gmail.com>
 <20240412180340.7965-5-fancer.lancer@gmail.com>
Autocrypt: addr=pabeni@redhat.com; prefer-encrypt=mutual;
 keydata=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
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev,
 Chen-Yu Tsai <wens@csie.org>, Simon Horman <horms@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 4/4] net: stmmac: Move MAC caps
 init to phylink MAC caps getter
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

T24gRnJpLCAyMDI0LTA0LTEyIGF0IDIxOjAzICswMzAwLCBTZXJnZSBTZW1pbiB3cm90ZToKPiBB
ZnRlciBhIHNldCBvZiBmaXhlcyB0aGUgc3RtbWFjX3BoeV9zZXR1cCgpIGFuZCBzdG1tYWNfcmVp
bml0X3F1ZXVlcygpCj4gbWV0aG9kIGhhdmUgdHVybmVkIHRvIGhhdmluZyBzb21lIGR1cGxpY2F0
ZWQgY29kZS4gTGV0J3MgZ2V0IHJpZCBmcm9tIHRoZQo+IGR1cGxpY2F0aW9uIGJ5IG1vdmluZyB0
aGUgTUFDLWNhcGFiaWxpdGllcyBpbml0aWFsaXphdGlvbiB0byB0aGUgUEhZTElOSwo+IE1BQy1j
YXBhYmlsaXRpZXMgZ2V0dGVyLiBUaGUgZ2V0dGVyIGlzIGNhbGxlZCBkdXJpbmcgZWFjaCBuZXR3
b3JrIGRldmljZQo+IGludGVyZmFjZSBvcGVuL2Nsb3NlIGN5Y2xlLiBTbyB0aGUgTUFDLWNhcGFi
aWxpdGllcyB3aWxsIGJlIGluaXRpYWxpemVkIGluCj4gbm9ybWFsIGRldmljZSBmdW5jdGlvbmlu
ZyBhbmQgaW4gY2FzZSBvZiB0aGUgVHgvUnggcXVldWVzCj4gcmUtaW5pdGlhbGl6YXRpb24gYXMg
dGhlIG9yaWdpbmFsIGNvZGUgc2VtYW50aWNzIGltcGxpZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTog
U2VyZ2UgU2VtaW4gPGZhbmNlci5sYW5jZXJAZ21haWwuY29tPgoKVGhpcyBpcyBhIG5ldC1uZXh0
IGZvbGxvdy11cCBmb3IgdGhlIHByZXZpb3VzIDMgcGF0Y2hlcwp0YXJnZXRpbmfCoCduZXQnLCBy
aWdodD8gCgpJZiBzbywgeW91IHNob3VsZCBoYXZlIHBvc3RlZCB0aGlzIG9uZSBzZXBhcmF0ZWx5
IGFmdGVyIHRoZSBvdGhlciB3b3VsZApoYXZlIGJlZW4gbWVyZ2VkIGJhY2sgaW50byBuZXQtbmV4
dC4KCldlIGNhbiBhcHBseSB0aGUgZmlyc3QgMyB0byAnbmV0JywgYnV0IHlvdSB3aWxsIGhhdmUg
dG8gcmVwb3N0IDQvNAphZnRlciB+VGh1LgoKVGhhbmtzLAoKUGFvbG8KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
