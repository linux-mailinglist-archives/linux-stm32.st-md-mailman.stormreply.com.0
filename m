Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3565763224A
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Nov 2022 13:36:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3680C65065;
	Mon, 21 Nov 2022 12:36:24 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ADB40C6504A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Nov 2022 12:36:23 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id x17so6190410wrn.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Nov 2022 04:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DFZS31orYUzmE7Oui/y7eLseJom8bGmCVAt+PCCfPxg=;
 b=fW5Mp6sgNTEJLfxwwpa6BIHYLAfya0or8LXwcsASGLmIq9mn1KR9RFWRL/2tWjqqAV
 lqiutzi4AG6MRhTQ4IXBpyEUf/lrKm1bRXVYDE3J7USVRAEZzfY5DHPpfA2sCaPCz9FR
 1WKF62zxbCIT5Eol+OpNmMlDQltt4rdDe5l+YyWNMe1KBTtDcWeeG53oEoI7TpRmWqAW
 MII2+ZrqXss/yMjy24JnfZcXyO+8ZYJG5p9S4xVSnRP/JZExG+jmX0i+siq4xk+M+X4q
 aK1N6gZkupNjcummiw+CrMzd8Cvr7+ctnrzsM/Xui4t94xPO8j0cXaGHiw1p0HvCi3u1
 fuFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DFZS31orYUzmE7Oui/y7eLseJom8bGmCVAt+PCCfPxg=;
 b=dc/EAimhYzvn/hOlbm5A+9bPLzHOzLS2tTn8aEVH+yuwELc7HS8yPW2uTQspaAXEmV
 //jbuidOE6FvFAjzE3fDy5u2dcUdEwX+ADhRQ/87d7Ozb83/KLVPiYQCXmHp9V9g/lO5
 7jy/ze8yIXppI3TaA5mMhvIiUyg1YtAJncIeUuOWTw8wbxGmeiOcfo4FOBs1ONwNoAoh
 pqhvRTvKTnkBZjRXxU1SnfzU5zTa3hK1haCw7En8wnqYUJS7d6i8H/kph+5lOujs7O0D
 0ccu+w3eZ57qd/ayyDJ9W3VRzLvH3UFZ2wtqyXiyEvR9SAohxsUGx8q6ETbdpGGBlpij
 oQ2A==
X-Gm-Message-State: ANoB5pkRTYSRyl0FLvjUgGJaRARpsPwDrguFhikudHUJCboFQ/0fiuvZ
 j4jU+irYLzbCH6rzDSDHEg4=
X-Google-Smtp-Source: AA0mqf5gaD4WIQX2sbEeb8QjK494DhuNzsLQ1Cu8gU+8er0XjItCmVLNx0maWmXAjD+rlO90gKR4Qw==
X-Received: by 2002:a5d:5a95:0:b0:241:65d4:8b41 with SMTP id
 bp21-20020a5d5a95000000b0024165d48b41mr10628536wrb.470.1669034183276; 
 Mon, 21 Nov 2022 04:36:23 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 6-20020a05600c024600b003b50428cf66sm13335494wmj.33.2022.11.21.04.36.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 04:36:22 -0800 (PST)
Message-ID: <f3697559-efd0-b3f9-9d64-17d2f8131a97@gmail.com>
Date: Mon, 21 Nov 2022 13:36:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
From: Matthias Brugger <matthias.bgg@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org
References: <20221121015451.2471196-1-bero@baylibre.com>
 <20221121015451.2471196-4-bero@baylibre.com>
 <8afd5100-9cef-50bd-2b53-e1a550973835@linaro.org>
 <5b28a9b0-3c31-75bd-3161-0ff9bddf0c54@gmail.com>
In-Reply-To: <5b28a9b0-3c31-75bd-3161-0ff9bddf0c54@gmail.com>
Cc: khilman@baylibre.com, linux-mediatek@lists.infradead.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/9] dt-bindings: pinctrl: mediatek,
 mt65xx: Make pins-are-numbered optional
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

CgpPbiAyMS8xMS8yMDIyIDEzOjMyLCBNYXR0aGlhcyBCcnVnZ2VyIHdyb3RlOgo+IAo+IAo+IE9u
IDIxLzExLzIwMjIgMDk6MDAsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4+IE9uIDIxLzEx
LzIwMjIgMDI6NTQsIEJlcm5oYXJkIFJvc2Vua3LDpG56ZXIgd3JvdGU6Cj4+PiBEb24ndCBsaXN0
IHRoZSBwaW5zLWFyZS1udW1iZXJlZCBwcm9wZXJ0eSBhcyByZXF1aXJlZAo+Pj4KPj4+IFNpZ25l
ZC1vZmYtYnk6IEJlcm5oYXJkIFJvc2Vua3LDpG56ZXIgPGJlcm9AYmF5bGlicmUuY29tPgo+Pj4g
LS0tCj4+Cj4+IEFuZCBob3cgYWJvdXQgbWFraW5nIHRoZW0gZGVwcmVjYXRlZD8gKGRlcHJlY2F0
ZWQ6IHRydWUpCj4+Cj4gCj4gSSB0aGluayB0aGF0J3Mgd2Ugd2FudCB0byBkby4KPiAKCkFsc28g
c3F1YXNoIDgvOSBpbnRvIHRoaXMgcGF0Y2guClNhbWUgY29tbWVudHMgaG9sZHMgZm9yIDQvOS4K
ClJlZ2FyZHMsCk1hdHRoaWFzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
