Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3321D546D
	for <lists+linux-stm32@lfdr.de>; Fri, 15 May 2020 17:25:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 237EFC36B10;
	Fri, 15 May 2020 15:25:38 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DDE9CC36B0E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 May 2020 15:25:36 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id u188so3117469wmu.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 May 2020 08:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YFhUWh3rqYQ5lYOCD1pUDd9xSXvV5hD7qu9U6/eGHK8=;
 b=u+wYi/xB7RG7dW9P//tCKce7JU27PuS4/ZEaQtTv/6A9bKF5AKlZUI4Ea2o+fuoUsD
 TYrrzV3tdNVH3TW8F+e0jman9omN7kjFyd2zEo2y0/Io8nUD7ENLB0oduoA9zTLnWJni
 UB1ky4C+gENKTORSOp5+6osP3oZiQyv2sS20GHf3dnAQ7D8xZr6VkWGdZpyWb25LvaTn
 BjZckcxWYsLcU7ESIEbw7J5bt31IzvwMENVE8PzoT84XHq3rvFGpEyCJ9TBzwGByr1yp
 KBea4JqUP9/UYZ80wYNCIdYpHHoQVw12Gc4Reks3GjzIVHXFJZIiSCyA0Dl7rJAU1xtF
 EIEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YFhUWh3rqYQ5lYOCD1pUDd9xSXvV5hD7qu9U6/eGHK8=;
 b=tyKJZS4BdSDv2pAScHF+t3nLuAGTrQIOGtSvtF8OzFVDUwALQnqkg7yj9kD0mpwSQ+
 T7/x1Slj6M7V+EepAYC76DmrFwt2ZfZct8qVJFgFuQ6Hi2nxNJk6xmAtZrPh0pFmivs9
 N0TFOKKsheuM+47bfq+alIYbnBsKmkc74niiOfvib+kiRoNKAOu46VynaAytDuR82ZYm
 uW4jncUf0Wo0t5PTDjySlo7GLxzdzMgePJI99LmLoTqCeddwVFL82mwIKI4XITNEXQP3
 74Fsp6jaTl3ov71z7T931uXmGGjx6vPkoEWCauFoqeVvAU96uUtd+cr1OxYd0DApHuyX
 Rfyg==
X-Gm-Message-State: AOAM531jAlx9YmS1znW+vLJ9YHlzOX9xu3j2GDcFNZLdfqCUV+BGM764
 biQLYRUeiNVWjFOMhp+rMSkazw==
X-Google-Smtp-Source: ABdhPJxJfjd9pQ/+v6j1z3nSlQv5vEd9TC1ju+/BM0f9fa47cxr7bzT/h/QNmZPQGNKf8QPtcqxPFg==
X-Received: by 2002:a05:600c:14c6:: with SMTP id
 i6mr4518549wmh.58.1589556336049; 
 Fri, 15 May 2020 08:25:36 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:5450:281:8a7d:dd9a?
 ([2a01:e34:ed2f:f020:5450:281:8a7d:dd9a])
 by smtp.googlemail.com with ESMTPSA id b20sm4282178wme.9.2020.05.15.08.25.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2020 08:25:35 -0700 (PDT)
To: Benjamin GAIGNARD <benjamin.gaignard@st.com>,
 Fabrice GASNIER <fabrice.gasnier@st.com>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 Alexandre TORGUE <alexandre.torgue@st.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>
References: <20200420121620.2099-1-benjamin.gaignard@st.com>
 <20200420121620.2099-6-benjamin.gaignard@st.com>
 <bbac5aa5-1c95-456e-3141-006d4fa86095@st.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <103c5558-4dc9-63c9-4994-5c8f97646eee@linaro.org>
Date: Fri, 15 May 2020 17:25:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <bbac5aa5-1c95-456e-3141-006d4fa86095@st.com>
Content-Language: en-US
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Pascal PAILLET-LME <p.paillet@st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v7 5/6] clocksource: Add Low Power STM32
 timers driver
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

SGkgQmVuamFtaW4sCgpPbiAwNS8wNS8yMDIwIDA5OjI2LCBCZW5qYW1pbiBHQUlHTkFSRCB3cm90
ZToKPiAKPiAKPiBPbiA0LzIwLzIwIDI6MTYgUE0sIEJlbmphbWluIEdhaWduYXJkIHdyb3RlOgo+
PiBGcm9tOiBCZW5qYW1pbiBHYWlnbmFyZCA8YmVuamFtaW4uZ2FpZ25hcmRAbGluYXJvLm9yZz4K
Pj4KPj4gSW1wbGVtZW50IGNsb2NrIGV2ZW50IGRyaXZlciB1c2luZyBsb3cgcG93ZXIgU1RNMzIg
dGltZXJzLgo+PiBMb3cgcG93ZXIgdGltZXIgY291bnRlcnMgcnVubmluZyBldmVuIHdoZW4gQ1BV
cyBhcmUgc3RvcHBlZC4KPj4gSXQgY291bGQgYmUgdXNlZCBhcyBjbG9jayBldmVudCBicm9hZGNh
c3RlciB0byB3YWtlIHVwIENQVXMgYnV0IG5vdCBsaWtlCj4+IGEgY2xvY2tzb3VyY2UgYmVjYXVz
ZSBlYWNoIGl0IHJpc2UgYW4gaW50ZXJydXB0IHRoZSBjb3VudGVyIHJlc3RhcnQgZnJvbSAwLgo+
Pgo+PiBMb3cgcG93ZXIgdGltZXJzIGhhdmUgYSAxNiBiaXRzIGNvdW50ZXIgYW5kIGEgcHJlc2Nh
bGVyIHdoaWNoIGFsbG93IHRvCj4+IGRpdmlkZSB0aGUgY2xvY2sgcGVyIHBvd2VyIG9mIDIgdG8g
dXAgMTI4IHRvIHRhcmdldCBhIDMyS0h6IHJhdGUuCj4gR2VudGxlIHBpbmcgdG8gcmV2aWV3ZXJz
IG9uIHRoaXMgZHJpdmVyIHBhcnQgb2YgdGhlIHNlcmllcy4KPiBUaGUgYmluZGluZ3MgYW5kIHRo
ZSBNRkQgaGF2ZSBiZWVuIHJldmlld2VkIHNvIEkgaG9wZSBJIGNhbiBwcm9ncmVzcwo+IG9uIHRo
ZSBkcml2ZXIgcGFydCB0b28uCgpbIC4uLiBdCgpzb3JyeSBmb3IgdGhlIGRlbGF5LgoKSG93IGRv
IHlvdSB3YW50IHRoZXNlIHBhdGNoZXMgdG8gYmUgbWVyZ2VkPwoKU2hhbGwgSSBwaWNrIHBhdGNo
IDYvNyA/CgoKCi0tIAo8aHR0cDovL3d3dy5saW5hcm8ub3JnLz4gTGluYXJvLm9yZyDilIIgT3Bl
biBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCgpGb2xsb3cgTGluYXJvOiAgPGh0dHA6Ly93
d3cuZmFjZWJvb2suY29tL3BhZ2VzL0xpbmFybz4gRmFjZWJvb2sgfAo8aHR0cDovL3R3aXR0ZXIu
Y29tLyMhL2xpbmFyb29yZz4gVHdpdHRlciB8CjxodHRwOi8vd3d3LmxpbmFyby5vcmcvbGluYXJv
LWJsb2cvPiBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
