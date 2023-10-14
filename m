Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F967C93C0
	for <lists+linux-stm32@lfdr.de>; Sat, 14 Oct 2023 11:27:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 319B2C6B444;
	Sat, 14 Oct 2023 09:27:32 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36708C6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 14 Oct 2023 09:27:31 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-405524e6768so28804075e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 14 Oct 2023 02:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697275650; x=1697880450;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=yqjTtNujnWMy88VPNV8UrR+LdaZ9WG6NKz13qE7MTmE=;
 b=e5smC2u+XMMcC9BHD9Nse4zN5w+b/Z+g03fhTkwMr02kAfqJFZ5JbzVu3RSmg1uATY
 L3w1KNjgN2Qvp/APgzASDMf7Y7LBTb9+NaqZEzSnYNT9Q02DBpjnXwgv/lwCsbKJ2FO6
 KC38kQPkiygcy/pUzhYVhej32a4smZ8NJbf2+RaTJy1n+5yCZDFYtuBUgdZqBiWp/wxJ
 S6fjMNbzpG9YE13pL8Zt6nRpN+bNJLSsu1GJzW9biiTOTtlYi/OZu1CsFfJ7DH/CfnA4
 ukI90LYvQdCXyQ0g3aBw+4a5nWGAYytgSm9Dq6Eu1fyTSDdEqLCGlMMvVC4IlyhVFQvj
 w6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697275650; x=1697880450;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yqjTtNujnWMy88VPNV8UrR+LdaZ9WG6NKz13qE7MTmE=;
 b=DS91Gjv2dS9CoOwMrV6rrxYwEDsEw9G8kotQzdYUmemWD1Uw6iG3N9/Xv6Ll0FOPsQ
 gwAN5XeBlvlDC494C/uXw3k+HcTfWT887NZkHNkRSeMEawXJcBqmfUl2l9VFQiogKHYW
 nge3u30RM2V8ufUJIasMhtfY7y3Uk8VExtEJ1oKMUHhki9MUhL5DjcHzG/eYcGl1H+3Z
 oyFierTSm1F3aJnEyPkRQ5LFI0wRPcx+fZ88QV2GYWj79px9wJfaeqCui3zeuMB0vope
 yyTCHklBZqiDGmjpdHBw79XrexeSWzJUxa2iPLKg6YZLQLdD9Kg+d7kp6HmQc28InV0i
 t0Fw==
X-Gm-Message-State: AOJu0Yx6HliEFJC9B2KYJHryRwbKRMNajSM/MxB+A2tuNMLXdEq/kA9i
 Rd8hsuznlJ7pBKI7Ux8yKX4=
X-Google-Smtp-Source: AGHT+IEKzWJbvz9sdajMP9sZmmvJ1GgbFvXL53QYeHYszED8GAmWTvoPfVlS7CXVxkH04Co8ImitsQ==
X-Received: by 2002:a05:600c:3544:b0:407:39ea:d926 with SMTP id
 i4-20020a05600c354400b0040739ead926mr18548553wmq.9.1697275650125; 
 Sat, 14 Oct 2023 02:27:30 -0700 (PDT)
Received: from Ansuel-xps. (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
 by smtp.gmail.com with ESMTPSA id
 bd10-20020a05600c1f0a00b004077219aed5sm1514878wmb.6.2023.10.14.02.27.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Oct 2023 02:27:29 -0700 (PDT)
Message-ID: <652a5f01.050a0220.6635d.5a6a@mx.google.com>
X-Google-Original-Message-ID: <ZSpe//2oYu6+cZws@Ansuel-xps.>
Date: Sat, 14 Oct 2023 11:27:27 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
References: <20231012100459.6158-1-ansuelsmth@gmail.com>
 <20231012100459.6158-4-ansuelsmth@gmail.com>
 <20231013181305.605fc789@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231013181305.605fc789@kernel.org>
Cc: linux-wireless@vger.kernel.org, Ping-Ke Shih <pkshih@realtek.com>,
 Jiri Pirko <jiri@resnulli.us>, Simon Horman <horms@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 Kalle Valo <kvalo@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, Hangbin Liu <liuhangbin@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Raju Rangoju <rajur@chelsio.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [net-next PATCH v2 3/4] net: stmmac: move TX
 timer arm after DMA enable
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

On Fri, Oct 13, 2023 at 06:13:05PM -0700, Jakub Kicinski wrote:
> On Thu, 12 Oct 2023 12:04:58 +0200 Christian Marangi wrote:
> > +static int stmmac_tx_clean(struct stmmac_priv *priv, int budget, u32 queue
> 
> missing comma at the end, does not build :(
> -- 
> pw-bot: cr

Sorry for wasting your time :(
Having to port this between 6.1 and net-next and it slipped in while
fixing the rebase conflict. Totally my fault.

-- 
	Ansuel
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
