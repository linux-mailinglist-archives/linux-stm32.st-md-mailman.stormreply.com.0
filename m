Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFB073B863
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jun 2023 15:07:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F4118C65E4F;
	Fri, 23 Jun 2023 13:07:03 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16E7CC65048
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jun 2023 13:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687525618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+nlw8o0x9EmBbnewRBB9FOcSf2qgr1xezY4CpDaC89M=;
 b=XCaFzr/qMKoKdtp30p9NQvr5AeV7Fz0JTV+cODfJwE7F3g2FCNjpEAF4tGfYd/qXws9Tf5
 VKE4qstc40uGe4dtyd/sM+QX03QHpfouyjIrTTY6/ch6e+/ovNS2KE4QYMA14bo+bwoQJv
 H+eaxLWTJHpE7iROp5r3GoIVCnV0lJ4=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-157-ZSwEHTZXM_6GlsHPx-A94Q-1; Fri, 23 Jun 2023 09:06:55 -0400
X-MC-Unique: ZSwEHTZXM_6GlsHPx-A94Q-1
Received: by mail-oi1-f198.google.com with SMTP id
 5614622812f47-3a034580b21so539000b6e.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jun 2023 06:06:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687525615; x=1690117615;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+nlw8o0x9EmBbnewRBB9FOcSf2qgr1xezY4CpDaC89M=;
 b=lC+3DwLh8LJlScTqgG+9/0wTvL6QgwahhSC0hhSAbUHl9UglM89ie2gWJCQT5uxDTa
 FVzPpFk1IIwVPnjyargnV83fsHC7pV3HTTMTyDP9ix2OzAx1wjouhLgS4s2yjTQyjlMx
 7UpLGE21euYf4WfsHjPwwPBThK2yOJlzlQIYFZ+EBlwzmgZhEn5OyrqRVdQZwjw5LPje
 s4bPzotNxHQ1Lle/cJ0Ej2fPRp09Qrq9VqaNvQ2e5jqPEiaH8Fx3GJWlB9iNmcv0Gp24
 DtxWVaacnyyRpg0vuCQjay5NBTzVuUqa5YA0GleACyxSKVfrrp6oxPVtPekbnSrl9U0P
 jmNA==
X-Gm-Message-State: AC+VfDzJkB9CN1gbtOGxZ/vFdmZBEZWFfJiZQ1Iz8HxVEqBrxWQRCPtq
 vp5dkTvaQKZ6ib5hu3BXmr69ycN9IHTY7mIugC4vZ1/cBolsYMPkE/E68sSgtbHJCmiY42H+RK9
 dV1vGithwyO893s8Wtk86Oz2aLd9gZTcgz93ia8pr
X-Received: by 2002:a05:6808:1386:b0:39e:b84b:4786 with SMTP id
 c6-20020a056808138600b0039eb84b4786mr20204377oiw.27.1687525615071; 
 Fri, 23 Jun 2023 06:06:55 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ73eFqk8vQn5O2qswhndAQq+yzi1FAVd85HKmLTe2wlqJ6VQg6y5tF3WlSHMlgK/pA6NSAzsQ==
X-Received: by 2002:a05:6808:1386:b0:39e:b84b:4786 with SMTP id
 c6-20020a056808138600b0039eb84b4786mr20204357oiw.27.1687525614823; 
 Fri, 23 Jun 2023 06:06:54 -0700 (PDT)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::f])
 by smtp.gmail.com with ESMTPSA id
 be18-20020a056808219200b003a05636f4a8sm2061949oib.29.2023.06.23.06.06.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jun 2023 06:06:54 -0700 (PDT)
Date: Fri, 23 Jun 2023 08:06:51 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Message-ID: <20230623130651.a36qensnjwx6j4ea@halaney-x13s>
References: <20230623100845.114085-1-brgl@bgdev.pl>
MIME-Version: 1.0
In-Reply-To: <20230623100845.114085-1-brgl@bgdev.pl>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Jose Abreu <joabreu@synopsys.com>, Andy Gross <agross@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, linux-arm-msm@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v2 00/12] net: stmmac: replace
 boolean fields in plat_stmmacenet_data with flags
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

On Fri, Jun 23, 2023 at 12:08:33PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> As suggested by Jose Abreu: let's drop all 12 boolean fields in
> plat_stmmacenet_data and replace them with a common bitfield.
> 
> v1 -> v2:
> - fix build on intel platforms
> 
> Bartosz Golaszewski (12):
>   net: stmmac: replace the has_integrated_pcs field with a flag
>   net: stmmac: replace the sph_disable field with a flag
>   net: stmmac: replace the use_phy_wol field with a flag
>   net: stmmac: replace the has_sun8i field with a flag
>   net: stmmac: replace the tso_en field with a flag
>   net: stmmac: replace the serdes_up_after_phy_linkup field with a flag
>   net: stmmac: replace the vlan_fail_q_en field with a flag
>   net: stmmac: replace the multi_msi_en field with a flag
>   net: stmmac: replace the ext_snapshot_en field with a flag
>   net: stmmac: replace the int_snapshot_en field with a flag
>   net: stmmac: replace the rx_clk_runs_in_lpi field with a flag
>   net: stmmac: replace the en_tx_lpi_clockgating field with a flag
> 
>  .../stmicro/stmmac/dwmac-dwc-qos-eth.c        |  4 +-
>  .../net/ethernet/stmicro/stmmac/dwmac-intel.c | 23 +++++------
>  .../ethernet/stmicro/stmmac/dwmac-mediatek.c  |  5 ++-
>  .../stmicro/stmmac/dwmac-qcom-ethqos.c        |  8 ++--
>  .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c |  2 +-
>  .../net/ethernet/stmicro/stmmac/dwmac-tegra.c |  4 +-
>  .../ethernet/stmicro/stmmac/stmmac_hwtstamp.c |  4 +-
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 40 +++++++++++--------
>  .../net/ethernet/stmicro/stmmac/stmmac_pci.c  |  2 +-
>  .../ethernet/stmicro/stmmac/stmmac_platform.c | 10 +++--
>  .../net/ethernet/stmicro/stmmac/stmmac_ptp.c  |  5 ++-
>  include/linux/stmmac.h                        | 26 ++++++------
>  12 files changed, 76 insertions(+), 57 deletions(-)
> 
> -- 
> 2.39.2
> 

The series looks proper to me:

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
