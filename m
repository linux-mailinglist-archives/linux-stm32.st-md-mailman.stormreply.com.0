Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEF6CCF18C
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Dec 2025 10:18:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C697BC87ED8;
	Fri, 19 Dec 2025 09:17:59 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B824C1A97F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Dec 2025 09:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1766135877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UOrqOC5iQbPsgw0GDAF8bS1t4BrrEVQdYEt9Qz67A0o=;
 b=g4jOVjbEmK9XEuspXciVHvTff7vW18gG4zsAK6UmVadgZkJvfTEeinxOs/EkCVs2UQ8u2O
 qJ7rnSB08Vw2ZSw9njkajDPiU/7lrmPrh0gjy5unukPfun5qXWlZlExZkFfkS+RgXQuVVV
 UyYmfAFtGZcE9do6PHZiPI5NlkOjSjg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-NhCLIi-oMxysxVvJL-gp2w-1; Fri, 19 Dec 2025 04:17:55 -0500
X-MC-Unique: NhCLIi-oMxysxVvJL-gp2w-1
X-Mimecast-MFC-AGG-ID: NhCLIi-oMxysxVvJL-gp2w_1766135875
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-430f79b8d4dso1162524f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Dec 2025 01:17:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766135874; x=1766740674;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UOrqOC5iQbPsgw0GDAF8bS1t4BrrEVQdYEt9Qz67A0o=;
 b=H1tvZiIWRLoA+SSxk7kCwCdeCuN+9BvCVTqSHZEtSHAi/jy0b8DhxvNhGSvpVCpdkT
 7kaJBX8RF5XPjoQ0HzisqVbyk6B/CNIfFoA5trG+iDZE9QP+Nd8yNNpKb2ceTJhdzZHn
 k4uYyFh/cC299aNBfXgKThMnziObGIUc84/4WP7LoTWOkGnYWhSPveJ69UZ+zQ1lmG3K
 x6M6t+L1eGbJV4fYCm2/HXA2kZ5h+irc+8tGpKQRHRymifyEfaiwfJH1JkbPmBUO8UZu
 fkGQ3WyGRFx9gKLKgGSFLjZjGY4DEMXS8kkUpL7iV+6k6N5rRse1EwSSlfoFf8DS0qHe
 1l0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/1/tDR0cvoV3trfzi4bCz0bkJtRj7ZRQB/svYIcpt1u7PnmnpZh6ohebbn1eADHJsZOqKLPCc04ArEA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxvcIESlFoIQlMkW9EVOnSU8W7rl8GNWFZS1/y+0NDSOvxMeU9d
 +CCpOBQUy2PmbgFfsMopu+Py4lUgiExwxNOmvFLKRnHM4ARVKjCHKLth9Omwlu/8zq476TfakZ/
 PFN3OVHCG2AnJFJciTGZ49pKOpy2JdY8UaGDNsJTrWeX81x6NKIji0ccj8ZBGYFHP8Iz3Txvo+K
 meW8PRog==
X-Gm-Gg: AY/fxX6TJf+Z3ETlOT79cHpmgdzKuUJJk71TogE0UEbE3kmIT+OeCRQ/BeHJWir8EpY
 kcogCJmQ/orNJlJvAfPmT+aEiTc2Kwp+DlTxAwlGLU6vhJO8EePV/jM7Swg8EjWCZhruW+IlbXH
 fsdGVwd3upC6ndcJeovFX5i85I9FiSJYSwFZrU+Ou7o63+4NCF7TTfMsDvgiMifzf9appqEnVQH
 c0IHWPiaT/Ub/FIRCyOGzcELq0wyUM43FV4OYxKlKxw1xjZR9MgMwSGbvyaJHYlCPh7UAgtCuAT
 q1ZF+oNIRU241rPkpyWlMrnEY10A92oEYxXl9Qu+k+5Qs7g4Ni8Hqni8uaYgJy1lZdkycYgCWRV
 FiibW6vjdSR2i
X-Received: by 2002:a05:6000:178c:b0:431:104:6daf with SMTP id
 ffacd0b85a97d-4324e709ab3mr2628698f8f.54.1766135874640; 
 Fri, 19 Dec 2025 01:17:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEgrjQPRHArCAjoq010AgJgcm4Stpg3HSOJLPvFxNuWXO0HKkDXVAQ+3nly1Bi0al/c+unpYA==
X-Received: by 2002:a05:6000:178c:b0:431:104:6daf with SMTP id
 ffacd0b85a97d-4324e709ab3mr2628669f8f.54.1766135874255; 
 Fri, 19 Dec 2025 01:17:54 -0800 (PST)
Received: from [192.168.88.32] ([216.128.11.227])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea227casm3924193f8f.15.2025.12.19.01.17.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Dec 2025 01:17:53 -0800 (PST)
Message-ID: <3c72a0d9-88e2-422a-9f9b-900ca7867091@redhat.com>
Date: Fri, 19 Dec 2025 10:17:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Lizhe <sensor1010@163.com>, heiko@sntech.de, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
References: <20251216150611.3616-1-sensor1010@163.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251216150611.3616-1-sensor1010@163.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8iunZ9feCWSkwhS0s0oBnYmrcBUAPmB3agOA-qtdADA_1766135875
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 1/2] net: stmmac: dwmac-rk:
 rename phy_power_on to avoid conflict
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 12/16/25 4:06 PM, Lizhe wrote:
> Rename local function 'phy_power_on' to 'rk_phy_power_set' to avoid
> conflict with PHY subsystem function. Keep original error handling.
> 
> Signed-off-by: Lizhe <sensor1010@163.com>

## Form letter - net-next-closed

The net-next tree is closed for new drivers, features, code refactoring
and optimizations due to the merge window and the winter break. We are
currently accepting bug fixes only.

Please repost when net-next reopens after Jan 2nd.

RFC patches sent for review only are obviously welcome at any time.


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
