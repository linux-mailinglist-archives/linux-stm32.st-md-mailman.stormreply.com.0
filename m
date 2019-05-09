Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F82187CD
	for <lists+linux-stm32@lfdr.de>; Thu,  9 May 2019 11:33:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 233FBC555BD
	for <lists+linux-stm32@lfdr.de>; Thu,  9 May 2019 09:33:32 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25269C05816
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 May 2019 09:33:30 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id y17so1393785wmj.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 May 2019 02:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=SyRgRxtjdMJpbsjK9vjm2B3TwSm8QJJ2pjmdSOpbmps=;
 b=AauaUrfm2cnOW6SNDfuMRv0+hlgU2BgvMMo5qTYqMWmgv0tM2Y605oJ9MDb6GCKkyr
 xxLZDhgFvVAUlAqzhZZgGwA2pJ050Cg3c+g34asToSOFZ08TE2qbNZLS3DeuykRS59oz
 8+wg3JumczxfcDO7Pl6qu7oRNbTm/41lIdyzvY1NkLggKzIkIhVByv0CcEtkutzoETEX
 NxstvI4XTnL3mAERfoDswn2CPdQJx+hVe0gJm0AM6FQHrltYCRVbW5fJLJS4w4cxHgzg
 ACVVbtk5SuzhgRFF6Z67DPh3S/iQNyWj0leAwGWeu9gnUt6RivRWexcjB7HEr88L+o0d
 BWvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=SyRgRxtjdMJpbsjK9vjm2B3TwSm8QJJ2pjmdSOpbmps=;
 b=mVW77lBp+Q7OY2vrr3GjY0n7o706p3FWbQiaHLBNz7A2ukoigFSlk9EUYTck9oqyrl
 hOXFJbOlSNRF9x8CfTvQnX473aixqYwZLgHykoCM3dJWA29beYScmNrso5YxL7GKctvB
 ZdxCrvNgcK3omnfNaz/sDxVfNxc7bWYKbt/L7oXoG69gjiTqOOMLrry961LnLobiIEo/
 sPK+87aUl69ADl9Z+x84VYp+2Fye5Z68YQ01brAS2Em+yjikdqyEMKNuxfflJuwcv01m
 4hwy1k4jJFFqDQEcem37Qvr2v/ywyqpxhMJsx0VWnXGnhBqRMCh7YTEvRRDWH7p8zdMA
 t4Gw==
X-Gm-Message-State: APjAAAUJNxP6TGekZxtML1oWAHI6fK3ZcYO35Bbuk8lO2Lpo+9HEjpx3
 7AhqNR+i2Vpean5OgpKLY8w0tg==
X-Google-Smtp-Source: APXvYqzWxiSGBE8sUUva3+DpZ/awGVFeFFPJtZu5iHJoO63RJCNa28okuodpAuszCvvYsv8zSHsUTA==
X-Received: by 2002:a1c:f111:: with SMTP id p17mr1919584wmh.62.1557394409462; 
 Thu, 09 May 2019 02:33:29 -0700 (PDT)
Received: from dell ([2.27.167.43])
 by smtp.gmail.com with ESMTPSA id j131sm4430911wmb.9.2019.05.09.02.33.27
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 09 May 2019 02:33:28 -0700 (PDT)
Date: Thu, 9 May 2019 10:33:26 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Amelie Delaunay <amelie.delaunay@st.com>
Message-ID: <20190509093326.GV31645@dell>
References: <1557392336-28239-1-git-send-email-amelie.delaunay@st.com>
 <1557392336-28239-2-git-send-email-amelie.delaunay@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1557392336-28239-2-git-send-email-amelie.delaunay@st.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v6 1/9] dt-bindings: mfd: Add ST
 Multi-Function eXpander (STMFX) core bindings
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

T24gVGh1LCAwOSBNYXkgMjAxOSwgQW1lbGllIERlbGF1bmF5IHdyb3RlOgoKPiBUaGlzIHBhdGNo
IGFkZHMgZG9jdW1lbnRhdGlvbiBvZiBkZXZpY2UgdHJlZSBiaW5kaW5ncyBmb3IgdGhlCj4gU1RN
aWNyb2VsZWN0cm9uaWNzIE11bHRpLUZ1bmN0aW9uIGVYcGFuZGVyIChTVE1GWCkgTUZEIGNvcmUu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogQW1lbGllIERlbGF1bmF5IDxhbWVsaWUuZGVsYXVuYXlAc3Qu
Y29tPgo+IFJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5v
cmc+Cj4gUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gQWNrZWQt
Zm9yLU1GRC1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KPiAtLS0KPiAgRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9zdG1meC50eHQgfCAyOCArKysrKysr
KysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspCj4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZk
L3N0bWZ4LnR4dAoKQXBwbGllZCwgdGhhbmtzLgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpM
aW5hcm8gU2VydmljZXMgVGVjaG5pY2FsIExlYWQKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ug
c29mdHdhcmUgZm9yIEFSTSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8
IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
