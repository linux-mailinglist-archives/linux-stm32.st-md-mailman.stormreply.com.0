Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B56138C37B
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Aug 2019 23:19:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66A45C35E02;
	Tue, 13 Aug 2019 21:19:31 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40B35C36B3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Aug 2019 21:19:30 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id j15so14322093qtl.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Aug 2019 14:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netronome-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=EFWQ4jRCEd8FDkIajgVLnR+9FJPAclCDJqxx4O3K6cM=;
 b=Uhqq6zLgUzH8NOnI6um+OvZlJTV4BOdsi9we2uNC6K9kKPpRJ/fKLAXMTOND4i58/4
 jUQeGgcoCwewV8FUpAKWd5CJPlt6G9tfZlDrFtQus00zfDwWbg19riTtLBj4XAqRG9Lj
 e6omlbWCvIA9q0rzQWEGDWrhCLNHK8xuAJ6t9XIY5ZxNghs4gn9Z4XhJmqcYQKxCFFK8
 HYYOaE/MHrthxHR8PaeSXpgrGMAsBQAYCRtzxsprE/JjO4hWMx5D3pSxLzZGbxTfes33
 uAIgEjcf+KZhxUqwgD07/+JNDvvmiutIWtHdbEpU4pSXxZLo/LHMK4n+w9Y2tWO8qM2r
 UqVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=EFWQ4jRCEd8FDkIajgVLnR+9FJPAclCDJqxx4O3K6cM=;
 b=uFv3xq8sXUOzJZHbemyd33GjhUsaIwZzujc7DWx1D9qCM7o5Q32Z9chxY7unmmeGf1
 FVn0uutiDtCoF3rU2m7Y2FZGGW58zyg4Hep1GKixyxq0DNv0WT6TpCOa0cWDQvT5HERo
 zCcifla07JEjFT+awfqrRpnqjpx7UWWaEtjW8FsuMhYDhGrxx21jA6aV8mz999+tsLTi
 tKJ7ZLOL24vR5HYqMHN+wTd+wJW2GXTh7yLtJMZLXhGdILTUMS6q0SxwRCSSzfGYAuNe
 h7QmBytk7mKKvxicnFc7m6QLbHQerpELnqK8D/CmWLwsBOiM0Eazvckf5eNDO5o+yw/u
 Iung==
X-Gm-Message-State: APjAAAWbFPMu913niuvFX3AvSjG/jihtyyd1KOqKRypHgyWw6DIxsDVS
 wDU9xkg4bQHVwyl0XsxJ5F2scg==
X-Google-Smtp-Source: APXvYqx8AHPEuStN+ub7pm2zn9aiQcHCFLgI8UqHRNn5qyIpv84YbbRdbjZrRhAdb/Zul9jpQxkcRA==
X-Received: by 2002:ac8:43c5:: with SMTP id w5mr35103972qtn.280.1565731169195; 
 Tue, 13 Aug 2019 14:19:29 -0700 (PDT)
Received: from cakuba.netronome.com ([66.60.152.14])
 by smtp.gmail.com with ESMTPSA id m38sm13989192qta.43.2019.08.13.14.19.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2019 14:19:29 -0700 (PDT)
Date: Tue, 13 Aug 2019 14:19:18 -0700
From: Jakub Kicinski <jakub.kicinski@netronome.com>
To: Jose Abreu <Jose.Abreu@synopsys.com>
Message-ID: <20190813141918.1601a649@cakuba.netronome.com>
In-Reply-To: <3d860a78ce4e98941f7e292d251d7360755fdf2e.1565602974.git.joabreu@synopsys.com>
References: <cover.1565602974.git.joabreu@synopsys.com>
 <3d860a78ce4e98941f7e292d251d7360755fdf2e.1565602974.git.joabreu@synopsys.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Cc: Joao Pinto <Joao.Pinto@synopsys.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 07/12] net: stmmac: Add
 ethtool register dump for XGMAC cores
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

On Mon, 12 Aug 2019 11:44:06 +0200, Jose Abreu wrote:
>  static void stmmac_ethtool_gregs(struct net_device *dev,
>  			  struct ethtool_regs *regs, void *space)
>  {
> -	u32 *reg_space = (u32 *) space;
> -
>  	struct stmmac_priv *priv = netdev_priv(dev);
> +	int size = stmmac_ethtool_get_regs_len(dev);
> +	u32 *reg_space = (u32 *) space;
>  
> -	memset(reg_space, 0x0, REG_SPACE_SIZE);
> +	memset(reg_space, 0x0, size);

no need to zero regs, ethtool core zallocs them
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
