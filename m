Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC88A7DB9E7
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Oct 2023 13:26:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74396C6B44B;
	Mon, 30 Oct 2023 12:26:25 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E8B0C6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Oct 2023 12:26:24 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-507c91582fdso6333510e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Oct 2023 05:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698668784; x=1699273584;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=T8RFmRMPaCavpWEVO+hqLK8PHwyFGH3KHrLeyNssBXM=;
 b=CKg2KW1nwvByrKR3YpAXFtyP7nlKZ39KsqkwXIYBXQzvyhXzX8rJJCrtGGwVAUoeGy
 MEUudWK0O4iXt6W7mC2tPDPIgtSMDNhI+mlxWmhXbe4+/BIqrRhz4i+RycylN9npGTtY
 TyT26Uh3vjUVXOeOgtZxBXXgLUIai4Kciatu9Egt/lO/FSFgctgdWztI61u2r8gS+hT5
 xBV6o8K52AL5kr4zvPT2vjvL2xrhcBie6VBtTKmfeh6AntKbcHIeep66XVDAhJ4xm92m
 hWshOhDCT37TBOX0U+n+8fxLbzw7UDr9r+N8r3qs3s6xo6jyUwZrGKfM2supH6qFce0I
 1IDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698668784; x=1699273584;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T8RFmRMPaCavpWEVO+hqLK8PHwyFGH3KHrLeyNssBXM=;
 b=u4IbmhS5CC8UOLGyJGPz63FWJbGuKJ5olN+FsTr4I8jIiz9EB8CHPlcBhr/6TJdfSQ
 Bg9erW1JqSKpZb2LHJAmihJKQ5Z1G8vd7W44FJW/guJODYM7jLUzche+6RGqHJVnxTgb
 Db6f0cKbf5SCYYliNZgct2tV6nG1ZlEhRrLjLqwBOColpypl7WPM4Dts1X2a8WNAc6KO
 Jr/lTsxfBNAe52hLBNUnuQBuuePu8JXbgY2ydZXxgB0W6eKA9r7JCfvFe0JgBob+h2kH
 kEjod9tNF/6K1xiIGvuSTq1wDzXJWol8hnIGjCWKW7140X6Ge+VJ6pdois2QZkIgx7b6
 JBTg==
X-Gm-Message-State: AOJu0Yw2kc/jCRjBdQyRRzUY6LP3BO6GmhmUC9KOuTNi/S5tkfbUgteC
 PB9MrcuNDOF25zhirRWvG0w=
X-Google-Smtp-Source: AGHT+IFg9cpzQXCYcHL4V6vW7U7XlYIDrLSpu4W2WLWjccR6BSlhTXw8Kl384Nxe+59YUTZpJQER+A==
X-Received: by 2002:a05:6512:10d6:b0:4fb:9168:1fce with SMTP id
 k22-20020a05651210d600b004fb91681fcemr8970346lfg.59.1698668783553; 
 Mon, 30 Oct 2023 05:26:23 -0700 (PDT)
Received: from mobilestation (srv1.baikalchip.ru. [87.245.175.227])
 by smtp.gmail.com with ESMTPSA id
 w10-20020ac254aa000000b00507a387c4c4sm1421843lfk.229.2023.10.30.05.26.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 05:26:23 -0700 (PDT)
Date: Mon, 30 Oct 2023 15:26:21 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <ayttoykypfn6obrysve6ivdom7it3wdyexeawoucekeivx236t@o7rljbjrofiz>
References: <20231030035550.2340514-1-0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231030035550.2340514-1-0x1207@gmail.com>
Cc: linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jacob Keller <jacob.e.keller@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 rock.xu@nio.com
Subject: Re: [Linux-stm32] [PATCH net-next v2] net: stmmac: xgmac: Enable
 support for multiple Flexible PPS outputs
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

On Mon, Oct 30, 2023 at 11:55:50AM +0800, Furong Xu wrote:
> From XGMAC Core 3.20 and later, each Flexible PPS has individual PPSEN bit
> to select Fixed mode or Flexible mode. The PPSEN must be set, or it stays
> in Fixed PPS mode by default.
> XGMAC Core prior 3.20, only PPSEN0(bit 4) is writable. PPSEN{1,2,3} are
> read-only reserved, and they are already in Flexible mode by default, our
> new code always set PPSEN{1,2,3} do not make things worse ;-)
> 
> Signed-off-by: Furong Xu <0x1207@gmail.com>

Please don't forget to add the already got tags shall you need more
patch revisions.

Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

> ---
> Changes in v2:
>   - Add comment for XGMAC_PPSEN description among different XGMAC core versions.
>   - Update commit message, thanks Serge Semin and Jacob Keller for your advices.

BTW Why have you dropped the Fixes tag? Moreover you didn't address
Jacob' comment regarding the actual problematic commit. This isn't the
way the review process normally goes. I'll copy what Jacob said in v1
so to restore the discussion here:

On Mon, Oct 27, 2023 at 2:15:50AM +0800, Jacob Keller  wrote:
> The original code was added in 95eaf3cd0a90 ("net: stmmac: dwxgmac: Add
> Flexible PPS support"), which landed in v5.4
> 
> It looks like XGMAC Core 3.20 support was not added until possibly
> commit 669a55560e4b ("net: stmmac: Check more MAC HW features for XGMAC
> Core 3.20") which appears to be new enough that its not in any official
> Linux release, though it looks like it was already in net.
> 
> Perhaps this should be tagged Fixes: and sent through net, hopefully to
> try and hit 6.6 or at least a stable release shortly after?
> 

Regards
-Serge(y)

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h     |  2 +-
>  .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    | 14 +++++++++++++-
>  2 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> index 7a8f47e7b728..a4e8b498dea9 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> @@ -259,7 +259,7 @@
>  	((val) << XGMAC_PPS_MINIDX(x))
>  #define XGMAC_PPSCMD_START		0x2
>  #define XGMAC_PPSCMD_STOP		0x5
> -#define XGMAC_PPSEN0			BIT(4)
> +#define XGMAC_PPSENx(x)			BIT(4 + (x) * 8)
>  #define XGMAC_PPSx_TARGET_TIME_SEC(x)	(0x00000d80 + (x) * 0x10)
>  #define XGMAC_PPSx_TARGET_TIME_NSEC(x)	(0x00000d84 + (x) * 0x10)
>  #define XGMAC_TRGTBUSY0			BIT(31)
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> index f352be269deb..453e88b75be0 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> @@ -1178,7 +1178,19 @@ static int dwxgmac2_flex_pps_config(void __iomem *ioaddr, int index,
>  
>  	val |= XGMAC_PPSCMDx(index, XGMAC_PPSCMD_START);
>  	val |= XGMAC_TRGTMODSELx(index, XGMAC_PPSCMD_START);
> -	val |= XGMAC_PPSEN0;
> +
> +	/* XGMAC Core has 4 PPS outputs at most.
> +	 *
> +	 * Prior XGMAC Core 3.20, Fixed mode or Flexible mode are selectable for
> +	 * PPS0 only via PPSEN0. PPS{1,2,3} are in Flexible mode by default,
> +	 * and can not be switched to Fixed mode, since PPSEN{1,2,3} are
> +	 * read-only reserved to 0.
> +	 * But we always set PPSEN{1,2,3} do not make things worse ;-)
> +	 *
> +	 * From XGMAC Core 3.20 and later, PPSEN{0,1,2,3} are writable and must
> +	 * be set, or the PPS outputs stay in Fixed PPS mode by default.
> +	 */
> +	val |= XGMAC_PPSENx(index);
>  
>  	writel(cfg->start.tv_sec, ioaddr + XGMAC_PPSx_TARGET_TIME_SEC(index));
>  
> -- 
> 2.34.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
