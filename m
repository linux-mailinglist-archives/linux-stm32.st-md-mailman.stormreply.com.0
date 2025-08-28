Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 875D9B39613
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Aug 2025 09:58:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E9F2C3F95C;
	Thu, 28 Aug 2025 07:58:47 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7FACFC3F95B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Aug 2025 07:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1756367925; x=1787903925;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nz66e75Mw/joctaT7IK/sW+8Q9QeMNVlbhhEkyRonII=;
 b=AnGCeCUthfJcF4fcXpcxhEYPkJtJyj16UBm+EpB0KTsW17eeOXoXXICc
 P+NIogHdg+my8n+n8k9Osr4rR8gQ9ZACxsnveql+8AJBQn1/ia3whlRjS
 NfxUZiNOPicuAG0Qug3LCNlETw2Pkmfy5mDD8EClUMYdaGJshhch5x9oj
 6h4Xfm487NMi/5JDY6xqcEC6GuHvtTVIZK0lk+6/waMLXIbNYY+TiYqnv
 3fZTPu5CIi0+alh7HfQYDPqqi4zEJKfmN7DPS3WC+VnY6wpYYAOp09IUJ
 +gsHX0zB/HdMSxfnwy9/4jRcz7PE9WNQkozRXp6DQvLl6msld8acnrIeu g==;
X-CSE-ConnectionGUID: m84Vz8+GRPe/MrLV5ldJOA==
X-CSE-MsgGUID: JvIyF86oT1OFgkVW/kgS2w==
X-IronPort-AV: E=Sophos;i="6.18,217,1751234400"; d="scan'208";a="45949539"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 28 Aug 2025 09:58:44 +0200
X-CheckPoint: {68B00C34-24-299FBAB0-EF52EDE7}
X-MAIL-CPID: 284D0053C170DCD727D862DA4D118536_5
X-Control-Analysis: str=0001.0A002121.68B00BC8.007F, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E67321612FF; Thu, 28 Aug 2025 09:58:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1756367920;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=nz66e75Mw/joctaT7IK/sW+8Q9QeMNVlbhhEkyRonII=;
 b=CAnb7nIEGTqAegv5WMD3yN1b6wd/oPzGGLaKxLhMcLOxzsBQayUmACfoRTfXzbIPh794MQ
 7xQGApYa0RHNPGoTQ+rSREEbMOse3K2oC37eRg/ESDaLDxCYxXhrY44sFjJwKHVp1Ubj+Q
 FRY40wvGre4dJxxF/4p3G2WD1P1vkfRkFIr+fCtMPKG+7yWiTBp+6bDUFDuyt8vqU7YTfF
 Z6BAfZ8qRTGLcKfYRhUbkJSk6+zCpBI6/iGmQKTKohhdIaUyH9VT7xjWoP6CjTk1FsP+xL
 8zFG/dPwuIteSmVAIjKUv1ovaxg++aibXUv1nUzGAlqGKBUrqECGVtSMOUmiJA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, richardcochran@gmail.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 frieder.schrempf@kontron.de, primoz.fiser@norik.com, othacehe@gnu.org,
 Markus.Niebel@ew.tq-group.com, linux-arm-kernel@lists.infradead.org
Date: Thu, 28 Aug 2025 09:58:36 +0200
Message-ID: <3304317.5fSG56mABF@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250825091223.1378137-7-joy.zou@nxp.com>
References: <20250825091223.1378137-1-joy.zou@nxp.com>
 <20250825091223.1378137-7-joy.zou@nxp.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, netdev@vger.kernel.org,
 linux-pm@vger.kernel.org, Frank.Li@nxp.com, linux-kernel@vger.kernel.org,
 Joy Zou <joy.zou@nxp.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject: Re: [Linux-stm32] [PATCH v9 6/6] net: stmmac: imx: add i.MX91
	support
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

Am Montag, 25. August 2025, 11:12:23 CEST schrieb Joy Zou:
> Add i.MX91 specific settings for EQoS.
> =

> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Joy Zou <joy.zou@nxp.com>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
> Changes for v5:
> 1. add imx91 support.
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c | 2 ++
>  1 file changed, 2 insertions(+)
> =

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/ne=
t/ethernet/stmicro/stmmac/dwmac-imx.c
> index c2d9e89f0063..2c82f7bce32f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
> @@ -301,6 +301,7 @@ imx_dwmac_parse_dt(struct imx_priv_data *dwmac, struc=
t device *dev)
>  	dwmac->clk_mem =3D NULL;
>  =

>  	if (of_machine_is_compatible("fsl,imx8dxl") ||
> +	    of_machine_is_compatible("fsl,imx91") ||
>  	    of_machine_is_compatible("fsl,imx93")) {
>  		dwmac->clk_mem =3D devm_clk_get(dev, "mem");
>  		if (IS_ERR(dwmac->clk_mem)) {
> @@ -310,6 +311,7 @@ imx_dwmac_parse_dt(struct imx_priv_data *dwmac, struc=
t device *dev)
>  	}
>  =

>  	if (of_machine_is_compatible("fsl,imx8mp") ||
> +	    of_machine_is_compatible("fsl,imx91") ||
>  	    of_machine_is_compatible("fsl,imx93")) {
>  		/* Binding doc describes the propety:
>  		 * is required by i.MX8MP, i.MX93.
> =



-- =

TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
