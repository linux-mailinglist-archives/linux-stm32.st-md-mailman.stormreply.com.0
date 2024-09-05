Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4CE96DCCA
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Sep 2024 16:58:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F804C78013;
	Thu,  5 Sep 2024 14:58:13 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C54BFC6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Sep 2024 14:58:05 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a8a7dddd2aaso3013766b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Sep 2024 07:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725548285; x=1726153085;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xylf9X58PdeAvnejc6uMarphR5HQ4AIAHZcsnVNJFQk=;
 b=MPXcg4cGXpW/jMrLj9IVjk+tRCpcRTDKErrB9ZP0Da3qnCu5NDBZjua2ceX1XRGpAU
 BQtQTVLrVpvgNp0dBtAX8FiQhpsNH9UQw5bYs6OT2NiR0nlrgN+x4KbQ+Mrq4K+R4Wu8
 31e0B7aAf/pPsuyDJ8TzFkpfbTZxsA7DpLlH8P+yFWL2lvFb3hIqzvQCMN9R/iH6q57C
 VDE15GNVOStPRDXsERQSx2POzBCQN1lcR+5QU+7gXtEX1IEWpxRq2FSz1QmJ2CgPbM4Q
 0PaEFLbd3PDFPqeS3pIY02IwuetRc7cnsHAL1KrQHdbIhFAV/cWUrOgx7WYHvmxR4bcy
 Mgrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725548285; x=1726153085;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xylf9X58PdeAvnejc6uMarphR5HQ4AIAHZcsnVNJFQk=;
 b=e6GqeOcxkaCYAYDJ8CDzFdcKyfGNNzbQCLVvb2y8VLqCMHVHEQqe3MWUuQl8Ezu0Vf
 PJTDQXUigI85Am2pgTETrcJgo3w83mZgNznqAdAcVbwL0BSoNfd70uAtQUXgwWqLZHXZ
 5TKwGVPGpHY+k85+zoLTj8bLrshss0hw2o9IHOUGhryi6dv4yGZOtQAEU+NaUX9q6qZy
 kCOalFv8kbAibocilZotZRGpJtR6bl6aEefka3mspJQVnbE4JzIrXBWZVnYXHtUdhFa0
 llQuEZ/tUk9/pRAJjTws2v9TLbgRGRRQ/+nqosoT7pHcWXi6VuYXUMvGkSzvNUYOn70O
 PmHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV89uU1HTSViKbWfCWXdR1YRPw8ZyxtQm4n+lAriW6LrDKxpUQugYV/SCrWRq5uxO64+76W+aNYF295iQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyfclJds+8soZMOxPc2d8rj/vGwCqYN6J0JgADWHu/hGVwMinPb
 VA6t1iypVtXfTfpg+l5Tg37dSh1bADx+Ggcui8OTbdW6TUu/tlUm
X-Google-Smtp-Source: AGHT+IFWgUHQjpPyF03ycuCrazcYNTIjo4bK7NC3jvKTTABsJhGvL/b4OqvEVAPSV5x1wPS7VF4ZTg==
X-Received: by 2002:a17:907:c21:b0:a7a:9d1e:3b28 with SMTP id
 a640c23a62f3a-a89a377d761mr914720066b.5.1725548285025; 
 Thu, 05 Sep 2024 07:58:05 -0700 (PDT)
Received: from skbuf ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a623a464csm145762466b.150.2024.09.05.07.58.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 07:58:04 -0700 (PDT)
Date: Thu, 5 Sep 2024 17:58:01 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20240905145801.hyhjalu3bjfh5gs5@skbuf>
References: <cover.1725518135.git.0x1207@gmail.com>
 <0b72fd0463b662796fd3eaa996211f1a5d0a4341.1725518135.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0b72fd0463b662796fd3eaa996211f1a5d0a4341.1725518135.git.0x1207@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux@armlinux.org.uk,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 rmk+kernel@armlinux.org.uk, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v8 3/7] net: stmmac: refactor FPE
 verification process
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

On Thu, Sep 05, 2024 at 03:02:24PM +0800, Furong Xu wrote:
>  struct stmmac_fpe_cfg {
> -	bool enable;				/* FPE enable */
> -	bool hs_enable;				/* FPE handshake enable */
> -	enum stmmac_fpe_state lp_fpe_state;	/* Link Partner FPE state */
> -	enum stmmac_fpe_state lo_fpe_state;	/* Local station FPE state */
> +	/* Serialize access to MAC Merge state between ethtool requests
> +	 * and link state updates.
> +	 */
> +	spinlock_t lock;
> +
>  	u32 fpe_csr;				/* MAC_FPE_CTRL_STS reg cache */
> +	struct timer_list verify_timer;
> +	struct ethtool_mm_state state;

I don't know what to say about keeping a full-blown struct
ethtool_mm_state copy in struct stmmac_fpe_cfg.

You don't populate two of its members: tx_active and tx_min_frag_size,
and thus they would be invalid if anyone tried to access them. And two
more of its member variables are populated with driver-constant values:
max_verify_time and rx_min_frag_size.

This leaves only verify_time, verify_status, pmac_enabled, tx_enabled,
verify_enabled. Maybe it would be better to just open-code these
variables directly in struct stmmac_fpe_cfg.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
