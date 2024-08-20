Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7057395834E
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Aug 2024 11:55:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28F11C6DD66;
	Tue, 20 Aug 2024 09:55:44 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48E5DC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2024 09:55:37 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-5bf006f37daso1871616a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2024 02:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724147737; x=1724752537;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uUSpPNWLulDMOHLV3kIAUbCGHrOEWNyLTeWcImUN1ec=;
 b=eVjUsj1Yu3Aaye4nTHowlxcfudoF2UKLHHUhrOk+BOI0w3akJKG5JHWaaqHALnXJ7u
 4tjqAiIWPxUNYy2bPbyKqSBnMCU3LArVjr/QZaicJUk3Ks2Ej3uYntPZsdWMjY3ml/mh
 xf3bhtWewRwQR16ZgLRFboDJr0JQr/l3NMha3e5nzGFonm6+mQ+onn+hlrco7TNi9bah
 Vo2Pm3lUno+r38JRl9cr++t7x20lxHt+Qwx/zFm7TOOVZw5/jOOiy44fDUIjm218v8Tk
 IUrnb6sga6hPW9kZU12MvGkWAxVwmKuOaohwCMB9tcru7vMKwEclKywgRxM3IP4hXbv4
 jumA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724147737; x=1724752537;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uUSpPNWLulDMOHLV3kIAUbCGHrOEWNyLTeWcImUN1ec=;
 b=wtap1m2+uzYa6iSxa/o8fhjh81fmSql1Z4N0IMyFOJweCyAsZGnTehvGbvR7GrP9k/
 S0ZityoJcl00r9gAwm2aD8sN15ArlGT8LoCOOmpl/bEI4MwOEUBFRJyC2q9luPLHqIO9
 jIFqW3/U6OcDjF7MzlOGPlGkPEMjhUoZTEZchHMmQ+488qwHZZu3p8u44t1oxW3343EV
 hzYp79tZvwaiq8geC3hc0dJB6D2DE12QWSzNDZRoubecoG3JXj/XgixqBpYynV1eiX7t
 HlmOFYQv22Is76zcygXPRxgCne5B3KSSZqPRbLV1WVVPnSDKobiSKMWVy/6TpvSwbjv2
 GWdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjlgJbO97L/94RBiRIPq00nZeKEl8wFSCv6HXpgVOQN82R0eRLaukZzBpnckn1lgTz2aPRiu4Cc221uQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyi0ZHYAMQH5Q2HaQ1BmO/zNpSVqSTap250+P47R0vypPUgz8yp
 w0Rz/4JxrESqeb4095/o2DnSYAdaG4C6WqL9GFAf7fsFwHCSZu2h
X-Google-Smtp-Source: AGHT+IH5LTsYnL6x/hh2mXdZe+5zXyKYpPulCp9WMq2HFgFskdkQAa8jNKnhkWrXxaKseumfJVV8YQ==
X-Received: by 2002:a05:6402:2802:b0:5be:fa76:55b4 with SMTP id
 4fb4d7f45d1cf-5bf0ad6fbebmr2490826a12.16.1724147736212; 
 Tue, 20 Aug 2024 02:55:36 -0700 (PDT)
Received: from skbuf ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bebbe7f3e0sm6561853a12.71.2024.08.20.02.55.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 02:55:35 -0700 (PDT)
Date: Tue, 20 Aug 2024 12:55:32 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20240820095532.tlwbogzhvpmejnvw@skbuf>
References: <cover.1724145786.git.0x1207@gmail.com>
 <cover.1724145786.git.0x1207@gmail.com>
 <2fc5d2d43b583f3e66b843783f067f5420a0c8da.1724145786.git.0x1207@gmail.com>
 <2fc5d2d43b583f3e66b843783f067f5420a0c8da.1724145786.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2fc5d2d43b583f3e66b843783f067f5420a0c8da.1724145786.git.0x1207@gmail.com>
 <2fc5d2d43b583f3e66b843783f067f5420a0c8da.1724145786.git.0x1207@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v4 1/7] net: stmmac: move
 stmmac_fpe_cfg to stmmac_priv data
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

On Tue, Aug 20, 2024 at 05:38:29PM +0800, Furong Xu wrote:
> By moving the fpe_cfg field to the stmmac_priv data, stmmac_fpe_cfg
> becomes platform-data eventually, instead of a run-time config.
> 
> Suggested-by: Serge Semin <fancer.lancer@gmail.com>
> Signed-off-by: Furong Xu <0x1207@gmail.com>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
