Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F67A04B14
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jan 2025 21:37:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 13FE3C78025;
	Tue,  7 Jan 2025 20:37:44 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15D9EC78022
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jan 2025 20:37:36 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-216395e151bso2391865ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Jan 2025 12:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1736282254; x=1736887054;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C1H/J3xaLiB+SOTacWZ1CrgmLpcpSfI8SMqoIoJuoKI=;
 b=IKTGYlpCB84t+WmiMwiB4BgT5frz/L+SmhofKDGVI8FH3P3tZCJtLct5RnXL5sjrX5
 ukN2ZNAwbISgHmogGdduYfUo4n8T96KuDtndju73Pk3SgldafbvBnIABOUJadpJZW6jz
 9AN1OB4mhWBjoKUvpaCOCztb2/1cZmhtNYQdWwNLsWz/Azh03yV0TmwCFw57zHZ26Zm9
 Qx1swzcViqW6T5qo7uQdGVL5KTFaB4wrd4RyLVyYmwiN5IiY5Ncr9YCX/L928sF2dh/4
 8VoBIkpJdkNKElxVU/ckEQzeLin0E+ljwyuNZVxyiumc/S/GnniS5vGy7cOoo2Lk7ZNu
 F/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736282254; x=1736887054;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C1H/J3xaLiB+SOTacWZ1CrgmLpcpSfI8SMqoIoJuoKI=;
 b=JgJp/4huFeHsTAX8KHzCWLvDNZgvm3QJWmKIoIm/G5YwT4tzObdwb2LXgDNEd67pZo
 tLiTMlLyhgXBXGvkVwb5RIbxTlhcClHG++sDFDQOe9q7jSHRn335+lWHuPOxROYgnhjv
 +9ohSFyigkUJntxNv7rOdAmwGLRwTlOrO6gGC8BYxEncrahOPLKAmEgaYWucqGlJm/dw
 ALCCPIr8jJWyUXihsldBLAeXxL9rFBdtsX/Qjzv+AtPhxJkn6jh2UeBwAjOyiTAidzMp
 yD+Ing3TBoyq/u09WC9NcCrPQ4y9BTUpWCFsPtK9TsAN211MtHijcOnSWC6gJHmPlw8F
 tniw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+zVozlDMJCjHsZ2TQkNFAggoNWB8VXgx8nbh9Wfm/T+SLhGKkXae1pLx+l6fsC1Rbe7ticJfF4zYBZg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzJhnQff0zr3sEZayWROuuGu2XJklG86NUEqllWEW695hJkuzEx
 iJgyVBqLEA7XQZPkfye3idLOjT26YpmPZXwHj2BQp2yZjcZp9apbZC9Irxo7X5Gbz+YJMIBiZb/
 wMbokXZkkjhCqK5oINZ8X/9Q0wKk=
X-Gm-Gg: ASbGncvz6g5RCSLPmXzxtTef6NCFuIJhsF54D2c+blxQyuSAZMZKz0LlM60ktNwo3LZ
 hRbDgpyAsDF34QeSKT8jmkApbTeUWf0+IcfOOK1YCarWkD4b6tog3
X-Google-Smtp-Source: AGHT+IFpy/zEv8gV0glc3e85eskiQiRjVRs6FkoV/+B0RRM/Pns1lF2tiJiK6t7vuZVqLlK8YkI/dPy0Q3JwAvn8b/M=
X-Received: by 2002:a17:903:41c6:b0:215:758c:52e8 with SMTP id
 d9443c01a7336-21a83c148abmr6677255ad.12.1736282254604; Tue, 07 Jan 2025
 12:37:34 -0800 (PST)
MIME-Version: 1.0
References: <20250107125613.211478-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250107125613.211478-1-krzysztof.kozlowski@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 7 Jan 2025 21:37:23 +0100
X-Gm-Features: AbW1kvYyTE4JPE8j-clACseuWPbFM0gz7gQf2hau2axwDVbwPBqu3atU2f_bDWs
Message-ID: <CAFBinCCwASspnr2u94K=SqTaheS00zwJVjoHOO67-qgw8hNbcg@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>,
 Doug Berger <opendmb@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Kevin Hilman <khilman@baylibre.com>, Brian Norris <briannorris@chromium.org>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-arm-kernel@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 Siddharth Vadapalli <s-vadapalli@ti.com>, Paolo Abeni <pabeni@redhat.com>,
 Dario Binacchi <dariobin@libero.it>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Grygorii Strashko <grygorii.strashko@ti.com>, Ray Jui <rjui@broadcom.com>,
 Kalle Valo <kvalo@kernel.org>, linux-can@vger.kernel.org,
 Roger Quadros <rogerq@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 linux-amlogic@lists.infradead.org,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Scott Branden <sbranden@broadcom.com>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next] dt-bindings: net: Correct
 indentation and style in DTS example
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

T24gVHVlLCBKYW4gNywgMjAyNSBhdCAxOjU24oCvUE0gS3J6eXN6dG9mIEtvemxvd3NraQo8a3J6
eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IERUUyBleGFtcGxlIGluIHRo
ZSBiaW5kaW5ncyBzaG91bGQgYmUgaW5kZW50ZWQgd2l0aCAyLSBvciA0LXNwYWNlcyBhbmQKPiBh
bGlnbmVkIHdpdGggb3BlbmluZyAnLSB8Jywgc28gY29ycmVjdCBhbnkgZGlmZmVyZW5jZXMgbGlr
ZSAzLXNwYWNlcyBvcgo+IG1peHR1cmVzIDItIGFuZCA0LXNwYWNlcyBpbiBvbmUgYmluZGluZy4K
Pgo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlcyBoZXJlLCBidXQgc2F2ZXMgc29tZSBjb21tZW50cyBk
dXJpbmcgcmV2aWV3cyBvZgo+IG5ldyBwYXRjaGVzIGJ1aWx0IG9uIGV4aXN0aW5nIGNvZGUuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tp
QGxpbmFyby5vcmc+Cj4gLS0tCj4gIC4uLi9iaW5kaW5ncy9uZXQvYW1sb2dpYyxtZXNvbi1kd21h
Yy55YW1sICAgICB8IDE0ICstLQpGb3IgYW1sb2dpYyxtZXNvbi1kd21hYy55YW1sOgpSZXZpZXdl
ZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWls
LmNvbT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
