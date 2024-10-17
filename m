Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBBF9A2A37
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Oct 2024 19:07:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 40466C78032;
	Thu, 17 Oct 2024 17:07:04 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0A79C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2024 17:06:56 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4314e64eba4so1456875e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2024 10:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729184816; x=1729789616;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BklMX6kfbrOCfwq57rgPw+skZZbUrE/VXthIxbMG8vM=;
 b=b99qi1xdU00GaxVaGfwO5v/N3JFCVhv1UyWTlgGT+CsZLtHOLKvUUTXuHN2jxDIfO0
 MJm1EKzQBTcCyYyWsewZr9cB2a6iuE/es0Lw/jj1gvTOT248rQS16YfGRD+hdS5a08P4
 PWBuH8s5SPaqBqqBEuibuY0RkARLSa1CczSUvXtc5RJvm62OkATle7+Qp9rTrmx+e1y1
 s8cw+xFBCSPpBeNE0dXkTSQnzKF8rQr5jixoBYlkEQ3F3pF/M84SsSm2q0AGATZrOV0P
 strJ4CKJqF1+0QKCiU94YqSIWhwFkxDmsQ6oghQYMkc4kh0r2SZQaV6N5rfo2JHHOVLJ
 tNLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729184816; x=1729789616;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BklMX6kfbrOCfwq57rgPw+skZZbUrE/VXthIxbMG8vM=;
 b=QEkC0IwQvIGdYghurdA7hDSeEy+drp4PPEt/ooFgk51z9BmtJfjUbz569i5Wd25WIz
 YgwSXXRkc5QnTYW3zVisPF/ewhW5ZuW067Cu4Km59UnPuShSXIyprlKD/tCSQK2kT4Pk
 hhS9yZKHqYcgZtz4riCYiPTBCRQvn4LoeMkb4XyX6rxIb27hATN3nRXAcDtWz3DFnr7m
 RpPJ9v6BCS9yXXJKySf0PwFHQWirrAVw/eP8Km+Oq9KGl15fDdwCBrZ/Wj5R7ttil8hh
 6q8Apg4f/bWgqBgg2OB+1TTcOmQO6xpgjiRLKkmH0UPIVkZr5HGplUN5f0OSMatwdJIx
 HeuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEWY7ThEcCAd+1D9yu/AVu/QibneM0NERpJteMSZvxYHLMbV/1U70eJljZYnX/Yrs2oznNsv2TXPi5kA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxcP834zgD+7x3fOmWxUrZsihh2rp4WKhSEqI2y+lTyOE5COisq
 crwYZz40i+P+wE+v2cKjAol2pF7JdBrdC5lPKy2ptCKrLSEZFP9g
X-Google-Smtp-Source: AGHT+IHzJDME5SIjxnynJhIsVC0xEhR+BB69pSxP+FYEqGEafYCH6L/9yl4C79ZfCTY8848O73S+qg==
X-Received: by 2002:a05:600c:3546:b0:42c:aeee:80c with SMTP id
 5b1f17b1804b1-4315080685amr24541995e9.9.1729184815932; 
 Thu, 17 Oct 2024 10:06:55 -0700 (PDT)
Received: from skbuf ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4316067dc70sm1376025e9.10.2024.10.17.10.06.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2024 10:06:55 -0700 (PDT)
Date: Thu, 17 Oct 2024 20:06:52 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Furong Xu <0x1207@gmail.com>, Serge Semin <fancer.lancer@gmail.com>
Message-ID: <20241017170652.jtg2abm532sp4uah@skbuf>
References: <cover.1728980110.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1728980110.git.0x1207@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1 0/5] net: stmmac: Refactor FPE
 as a separate module
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

On Tue, Oct 15, 2024 at 05:09:21PM +0800, Furong Xu wrote:
> Refactor FPE implementation by moving common code for DWMAC4 and
> DWXGMAC into a separate FPE module.
> 
> FPE implementation for DWMAC4 and DWXGMAC differs only for:
> 1) Offset address of MAC_FPE_CTRL_STS and MTL_FPE_CTRL_STS
> 2) FPRQ(Frame Preemption Residue Queue) field in MAC_RxQ_Ctrl1
> 
> Tested on DWMAC CORE 5.20a and DWXGMAC CORE 3.20a
> 
> Furong Xu (5):
>   net: stmmac: Introduce separate files for FPE implementation
>   net: stmmac: Introduce stmmac_fpe_ops for gmac4 and xgmac
>   net: stmmac: Rework marco definitions for gmac4 and xgmac
>   net: stmmac: xgmac: Rename XGMAC_RQ to XGMAC_FPRQ
>   net: stmmac: xgmac: Complete FPE support
> 
>  drivers/net/ethernet/stmicro/stmmac/Makefile  |   2 +-
>  drivers/net/ethernet/stmicro/stmmac/common.h  |   1 +
>  .../net/ethernet/stmicro/stmmac/dwmac4_core.c |  12 -
>  drivers/net/ethernet/stmicro/stmmac/dwmac5.c  | 150 ------
>  drivers/net/ethernet/stmicro/stmmac/dwmac5.h  |  26 --
>  .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |   7 +-
>  .../ethernet/stmicro/stmmac/dwxgmac2_core.c   |  28 --
>  drivers/net/ethernet/stmicro/stmmac/hwif.c    |   7 +
>  drivers/net/ethernet/stmicro/stmmac/hwif.h    |  54 ++-
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  10 -
>  .../ethernet/stmicro/stmmac/stmmac_ethtool.c  |   2 +-
>  .../net/ethernet/stmicro/stmmac/stmmac_fpe.c  | 442 ++++++++++++++++++
>  .../net/ethernet/stmicro/stmmac/stmmac_fpe.h  |  38 ++
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 149 +-----
>  .../net/ethernet/stmicro/stmmac/stmmac_tc.c   |   4 +-
>  15 files changed, 527 insertions(+), 405 deletions(-)
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h
> 
> -- 
> 2.34.1
> 

Sergey Syomin is the one who originally requested the splitting of FPE
into a separate module.
https://lore.kernel.org/netdev/max7qd6eafatuse22ymmbfhumrctvf2lenwzhn6sxsm5ugebh6@udblqrtlblbf/

I guess you could CC him on next patch revisions, maybe he can take a
look and see if it is what he had in mind. I don't care so much about
internal stmmac organization stuff.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
