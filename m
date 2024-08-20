Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBB495871F
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Aug 2024 14:37:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97924C6DD6B;
	Tue, 20 Aug 2024 12:37:47 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C4CBCFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2024 12:37:41 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a7a81bd549eso442552466b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2024 05:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724157460; x=1724762260;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=u2jK4yPx4+3xmhvpK4yijnOCWRTycZTzx5NwT7STrrQ=;
 b=H9zuXt7zQ89DxrTu9ry/Saz4B0qwyxxSK8qYxMF4a5VU7bPNUOFeOit8yJVRY42Gs8
 AU5Pnt1o4UvccypigfLieekJXy8TZMbsnRSUzgLYrUqBoksZz8q+lwdX/ASHj+key8ot
 IzlMbe/rCYP8nnPtf2LMemJwIwUYEuhwLvM27idmyLMg6fUBoGhObqmhyiDR1PK339VC
 EH28HfuZHIC5oO3zFtCOaLKpypA3RN5yIbIXSQkmi8xg5al9oM+ukWNpCH/xllLpzPy7
 f7+OlaoU1AiVohb5F/d1DPd2OBJqkiOXSP/h0Khz5Go+TVb9WInIK5qz3Q1vmU90ccG2
 LuWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724157460; x=1724762260;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u2jK4yPx4+3xmhvpK4yijnOCWRTycZTzx5NwT7STrrQ=;
 b=wUShxQDkdq4aRMe00vyTkWN1URYwjbCegk5BIEUBmowr7TfvohCcVmmQoSGJerM807
 D93HpmgxsQuUhIhZe2cT6Dzvna4NfJtY3nRKdkc0iEwVMd2d1t0ojUlX0nJ+L388TkOs
 fuP5ttDG5EhIN1XiZlibJY16jzWcvVwcU66y76wAYyG2jLLs2drXsqYYl6XfoB6cBSOn
 npC+lg3/5B7/ugfm91OR6HrNgm37+w//hxOOdITffUgoff/jI3yqD+tkqXB0xsAfOOkf
 Nyr4E3p/UXfHsmAPicJO/Khnp8mmtJdP5xNYNkyTDfurHPRaD9O723dRN31hUYuKlxe7
 vHiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1jMjGrBYzJkqbJ9BBpwBcjL1F9w+rCSKbaAmUL6By54OKQH5mi5fGjVqrsLWKAi0t/stBIfxyxELvdH4jlMbIGo1pPyCllCwwtLB/dorzRxHMBIeK8peA
X-Gm-Message-State: AOJu0YwwA3GYDMCbgzHFM+FNfcgvAxlMSDFk0CrfeGU+ydi0WUh31usa
 1bFC6Fw3L9LoaQBAMEnI2N7m4BtxC7KKf+nu5we0QKHouEG1x3+A
X-Google-Smtp-Source: AGHT+IEnFLaRCBdXyPNV3Gh/d/fIvJ4GLVS182SUvRH2sa8DDTUCqoFD2e3s6tHxCNrIcyWJR2snGQ==
X-Received: by 2002:a17:907:948d:b0:a77:c0f5:69cc with SMTP id
 a640c23a62f3a-a8392a46c63mr817589366b.61.1724157459917; 
 Tue, 20 Aug 2024 05:37:39 -0700 (PDT)
Received: from skbuf ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8383947187sm752949366b.166.2024.08.20.05.37.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 05:37:39 -0700 (PDT)
Date: Tue, 20 Aug 2024 15:37:36 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20240820123736.hkkzg4ijd6u2rtfi@skbuf>
References: <cover.1724152528.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1724152528.git.0x1207@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v5 0/7] net: stmmac: FPE via
	ethtool + tc
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

On Tue, Aug 20, 2024 at 07:20:34PM +0800, Furong Xu wrote:
> Move the Frame Preemption(FPE) over to the new standard API which uses
> ethtool-mm/tc-mqprio/tc-taprio.
> 
> Changes in v5:
>   1. fix typo in commit message
>   2. drop FPE capability check in tc-mqprio/tc-taprio

omg, I didn't even finish reviewing v4, and I haven't been doing anything
else since you posted it :-/

In Documentation/process/maintainer-netdev.rst there's a recommendation
to allow for 24 hours between patch submissions. Please observe that, to
avoid situations like these. Thank you.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
