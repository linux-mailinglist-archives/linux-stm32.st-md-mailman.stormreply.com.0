Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 939AE72547A
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Jun 2023 08:40:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5842BC6A5FB;
	Wed,  7 Jun 2023 06:40:17 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF74BC6905A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jun 2023 06:40:15 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-565d354b59fso80211167b3.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Jun 2023 23:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1686120015; x=1688712015;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9d2sCd7ah2vbojw+2oUIoDVwhMBRN5y5qh24H2kySsU=;
 b=f0RZdEMQ464ceL/uRZ10D3Eig8SLZ9Ww3zWyqBRJvU9jMbPmnw4KZw0aCajmu5ElKD
 IlC/f7cx6mivVp7ryDID9C6k1iebxdKMJ8zYKQqeiKdzFEmn065WdfBBMoHJgRR3H6t4
 mzKaZve8nW/ROna1hFKTqqkAxuAMflmTUNOiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686120015; x=1688712015;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9d2sCd7ah2vbojw+2oUIoDVwhMBRN5y5qh24H2kySsU=;
 b=ZFQcXWFc3YlptsfA8mhTxd1aa6ChKRqL580W2+WO9BS6eOb1tIf1s+L2z5ehw7lh8Q
 rNS/+6OL22O65XryaZlYo70Pg7R+45REQoXxZIOy0IdghVFiRpL0/PnhEsJr9elIZIha
 nog7TpOtrLEvWCibBtPRjsToZEIMuJLIcjJgNFN3w+GF6T0sr4XUTd3zNzbEGlpoDXqC
 OluEMCezuGsgEI5op6hj3QDiP46ejx46LG793EajSdEr8dGacgOizeloITEei6dkDNvG
 nY9UNHNuL7J0xKvzOXbcXaLa1f6/UU+1I3Zyetl0VQqx/Gmi7QoymMImt0MYlsUPZQzW
 VePw==
X-Gm-Message-State: AC+VfDwg1glQf+bW5NzpROOWMnNST+swH1+F7Gx4L3h3Q7vQJf2EkUoz
 GqJPtWxY6HQmFSMIne1vF7WU92NO+Dwchhvf3Z70TQ==
X-Google-Smtp-Source: ACHHUZ4FcSqI9UJuhz5QJp3BxxWbzaB69qaQ0llUyrzZcvr85u9WKmZk2Gw3vKaFZgAl6y6Ws+AbiDt3xWboKEU4CHM=
X-Received: by 2002:a0d:d552:0:b0:566:c47:d06a with SMTP id
 x79-20020a0dd552000000b005660c47d06amr5357912ywd.13.1686120014887; Tue, 06
 Jun 2023 23:40:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230607063139.621351-1-dario.binacchi@amarulasolutions.com>
 <20230607063139.621351-5-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20230607063139.621351-5-dario.binacchi@amarulasolutions.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 7 Jun 2023 12:10:03 +0530
Message-ID: <CAMty3ZA-8zyzqzjOehKa1=zE+GoMw8j2NbgZuythAafSjHVczw@mail.gmail.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>, Conor Dooley <conor.dooley@microchip.com>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RESEND PATCH v2 4/6] dt-bindings: display:
	simple: add Rocktech RK043FN48H
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

T24gV2VkLCBKdW4gNywgMjAyMyBhdCAxMjowMeKAr1BNIERhcmlvIEJpbmFjY2hpCjxkYXJpby5i
aW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4gd3JvdGU6Cj4KPiBBZGQgY29tcGF0aWJsZSB0
byBwYW5lbC1zaW1wbGUgZm9yIFJvY2t0ZWNoIERpc3BsYXlzIExpbWl0ZWQKPiBSSzA0M0ZONDhI
IDQuMyIgNDgweDI3MiBMQ0QtVEZUIHBhbmVsLgo+Cj4gU2lnbmVkLW9mZi1ieTogRGFyaW8gQmlu
YWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+IEFja2VkLWJ5OiBD
b25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+Cj4gLS0tCgpSZXZpZXdl
ZC1ieTogSmFnYW4gVGVraSA8amFnYW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
