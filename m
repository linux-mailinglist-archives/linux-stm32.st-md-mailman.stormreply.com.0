Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B93E154D41C
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Jun 2022 00:01:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4588CC5E2C6;
	Wed, 15 Jun 2022 22:01:44 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D024C03FDD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jun 2022 22:01:41 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id z14so7629533pjb.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jun 2022 15:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=kJzZPwhMKjOWBCIigpbSF9J8bajdVzfVoc3uDXQW95Q=;
 b=Cj08PqxuzpVVhXXh9YrJ4jX+ng1DznIaTS8jjwd8bJDdUt+McGQf9d60X+SFrohetr
 xQPXCAn3LLqD4bAo8U2YhlKsIoCrDwme576BY+Tw0ixfkHRXey2jKP2TXWrw1TXjBO6Y
 NZYkNEZyZa7dT3QgDHHqT2k5gsNjsb7dVnkRwcGrKBcGY7G3dlsvqAU8yonj0Zae8qS1
 gftbfrFL+3WB9gd39pJsJS9bBrharUYJGEWA4lkuDtIM01pO2ryKr6fWuCvK5fk+47Ce
 gTt+LOZiHhHKHx2P9Hs+xjTFaTUwo2ykiSy1xz72/yUPL0Y2n0YQONASgzfTtcPyX1TS
 iVZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=kJzZPwhMKjOWBCIigpbSF9J8bajdVzfVoc3uDXQW95Q=;
 b=MxaXpnwVgRaAgmBWQZiPQl6ZpX+LFvOsYWjWQHNHV+zRwYCAkgi9I+OjKD/E6XMhtW
 BRzWgWcLJhJdtkb/GblbI6WMHlSfIyO2fXdeIqic3eHCp/cwITof0b8cGyBWKcu8pnrw
 LJubaJ1OBDVy4qGF2Y3IvsgXFc9jYPlENSRC1Y7vCiR85IqQ1KdCjEJ4f1Z7hrja57i3
 fkamqKbMB4xUFVI8di0PW85mTgRLFZrH6SasvZdeNuYhNwqeVx/O6GVvsirYZYHXr9IY
 nakV4nVQBDXbC769RmhUl0CbVVUTxMXHG2Ai6XcjDfmCSd68XGQXBDk2f0Fn9Fk9ADEP
 fZ7g==
X-Gm-Message-State: AJIora9X19vQTZ36Oyvs+UhXyL90lMVcdrVeW4YyPz9Ir4PNxyng1Dmn
 ombdiL2W5xSSHj/dJgQ4yzjtkw==
X-Google-Smtp-Source: AGRyM1tB/7rxj1PsrZbLttdzJ6N39++gXEeBXcuBdRQ9WFZYl1LBho6PCNK+K4HVQ1fuZnvJNAs8qw==
X-Received: by 2002:a17:903:2645:b0:167:92f1:15c0 with SMTP id
 je5-20020a170903264500b0016792f115c0mr1589014plb.100.1655330500612; 
 Wed, 15 Jun 2022 15:01:40 -0700 (PDT)
Received: from google.com ([192.77.111.2]) by smtp.gmail.com with ESMTPSA id
 q22-20020a17090a431600b001eae86cf683sm63878pjg.42.2022.06.15.15.01.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 15:01:40 -0700 (PDT)
Date: Wed, 15 Jun 2022 23:01:38 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <YqpWwqNBgfK5nHr0@google.com>
References: <20220519162838.695404-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220519162838.695404-1-u.kleine-koenig@pengutronix.de>
Cc: devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, kernel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 1/2] dt-bindings: mfd: stm32-timers:
 Document how to specify interrupts
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

T24gVGh1LCAxOSBNYXkgMjAyMiwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cgo+IFRoZSB0aW1l
ciB1bml0cyBpbiB0aGUgc3RtMzJtcDEgQ1BVcyBoYXZlIGludGVycnVwdHMsIGRlcGVuZGluZyBv
biB0aGUKPiB0aW1lciBmbGF2b3VyIGVpdGhlciBvbmUgImdsb2JhbCIgb3IgZm91ciBkZWRpY2F0
ZWQgb25lcy4gRG9jdW1lbnQgaG93Cj4gdG8gZm9ybWFsaXplIHRoZXNlIGluIGEgZGV2aWNlIHRy
ZWUuCj4gCj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5p
Z0BwZW5ndXRyb25peC5kZT4KPiAtLS0KPiBDaGFuZ2VzIHNpbmNlIHYzOgo+ICAgLSBEbyB0aGUg
dGhpbmdzIFJvYiBzdWdnZXN0ZWQgaW4gcmVxbHkgdG8gdjEgd2hpY2ggSSBkaWRuJ3Qgbm90aWNl
Cj4gICAgIHVudGlsIEZhYnJpY2UgdG9sZCBtZSBpbiByZXBseSB0byB2My4KPiAKPiAgLi4uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbWZkL3N0LHN0bTMyLXRpbWVycy55YW1sICB8IDE1ICsrKysrKysr
KysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKQoKQXBwbGllZCwgdGhh
bmtzLgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpQcmluY2lwYWwgVGVjaG5pY2FsIExlYWQg
LSBEZXZlbG9wZXIgU2VydmljZXMKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUg
Zm9yIEFybSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIg
bWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
c3RtMzIK
