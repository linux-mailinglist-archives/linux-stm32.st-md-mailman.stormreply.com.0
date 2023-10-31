Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEA47DCAE8
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Oct 2023 11:32:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1DB46C6B44B;
	Tue, 31 Oct 2023 10:32:18 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D44EC65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Oct 2023 10:32:17 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2c5629fdbf8so75661591fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Oct 2023 03:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698748337; x=1699353137;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=P2EcXXb07HwmX+NKag4u1J9dCkLQ+vbQgj8O5yieG1U=;
 b=cBmjrDGSYdirtB7AgnvaB6FCRq89tP6PD046zMSuJykyFXwvVymRaPpYw33MyVipgV
 fbHRZXO6kEP/aWu+gP4++Zklz4ivuHYqV42p7IrDlY7HZ4QBob9BJScIDb3e0M/GzLDz
 FAKPbeqDbwwCPz+hgXSSWG6ZtAQU/SbHNDiOftMOrmFAbQgHU1/kSaX2ZCIrRJKrZstq
 HBmHed3/gV7p1xNWToYHUwqci19qRByzWhzpREzjN7QnAD02VtJLP+txppvXoz+6n3C7
 gLLYTvXC71f7EfVyauSOsXcgH9wkofkryvTKhPswGERRNswG856lNI1tgdOFSJYjvFtL
 w0QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698748337; x=1699353137;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P2EcXXb07HwmX+NKag4u1J9dCkLQ+vbQgj8O5yieG1U=;
 b=sU2RkNAQBjgj7UhwiJjp9srN9x4XzoId5XwqaDBq5wf5QIc4oaXEkci8pXUZm29fAk
 jLTwyYj4e1Qr1dQLETzymMxr/pc6ydFLsVXRN2uB7wqmQvc4G2KAhMnHWcBA5DTnz4Uw
 0k3TKDeOAmxUHH7LLx6M6i/PTPkvq1Mf/R+t24DM7ioMYljCV0s6+VYAmS/ZCqyqynky
 wiPxYZ5qcLlWcJAxucWzewFKqWa3yYyctUyU9R5KGFSOJjiGhwp0fxGNtCh5LENP5EEe
 olvcODlT9UcVBDu6tgRomvW5wc0N9Mz6d5/r4+6ZChplnhxaznrJ+IdsCADy+Q3yw5ze
 Tj1A==
X-Gm-Message-State: AOJu0Yw/5tggJfRmFAdqKwPQHCmAubd661x6euSOuCG7fmqrnK0AVPrc
 diIKc3bw5Vze1ea68BgFoDM=
X-Google-Smtp-Source: AGHT+IGJwLuxMYrTKC33uhg0n2AffamtWMz+ALnEYm4KltCHV35cdvrMhXSxJwkHCNK7V66cu77AMg==
X-Received: by 2002:a05:6512:312f:b0:507:9ae3:6ba7 with SMTP id
 p15-20020a056512312f00b005079ae36ba7mr8656903lfd.67.1698748336364; 
 Tue, 31 Oct 2023 03:32:16 -0700 (PDT)
Received: from mobilestation (srv1.baikalchip.ru. [87.245.175.227])
 by smtp.gmail.com with ESMTPSA id
 s12-20020a056512202c00b005056fb1d6fbsm169248lfs.238.2023.10.31.03.32.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 03:32:15 -0700 (PDT)
Date: Tue, 31 Oct 2023 13:32:13 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Bernd Edlinger <bernd.edlinger@hotmail.de>
Message-ID: <j37ktiug7vwbb7h7s44zmng5a2bjzbd663p7pfowbehapjv3by@vrxfmapscaln>
References: <AS8P193MB1285DECD77863E02EF45828BE4A1A@AS8P193MB1285.EURP193.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AS8P193MB1285DECD77863E02EF45828BE4A1A@AS8P193MB1285.EURP193.PROD.OUTLOOK.COM>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Wait a bit for the reset to
	take effect
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

On Mon, Oct 30, 2023 at 07:01:11AM +0100, Bernd Edlinger wrote:
> otherwise the synopsys_id value may be read out wrong,
> because the GMAC_VERSION register might still be in reset
> state, for at least 1 us after the reset is de-asserted.

From what have you got that delay value?

-Serge(y)

> 
> Add a wait for 10 us before continuing to be on the safe side.
> 
> Signed-off-by: Bernd Edlinger <bernd.edlinger@hotmail.de>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 5801f4d50f95..e485f4db3605 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -7398,6 +7398,9 @@ int stmmac_dvr_probe(struct device *device,
>  		dev_err(priv->device, "unable to bring out of ahb reset: %pe\n",
>  			ERR_PTR(ret));
>  
> +	/* Wait a bit for the reset to take effect */
> +	udelay(10);
> +
>  	/* Init MAC and get the capabilities */
>  	ret = stmmac_hw_init(priv);
>  	if (ret)
> -- 
> 2.39.2
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
