Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B4703107C09
	for <lists+linux-stm32@lfdr.de>; Sat, 23 Nov 2019 01:34:38 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 698C0C36B0B;
	Sat, 23 Nov 2019 00:34:38 +0000 (UTC)
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4DF44C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 23 Nov 2019 00:34:36 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id q23so1939989otn.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Nov 2019 16:34:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=phRtDY+6nhN89i9bxspsg5KDJ+w/2SxWdZGysdx9BMs=;
 b=B4t84ssuKt5Y3ryfVNq23JeFUaCpw0lxuWY0BWbyRRQvgjFXFRq/XsZJ2u3NOiAOPr
 03JjTC1XTufU1DhwfR41aRiT2nKyA9bo8uhP+e3Jdqf7kWJLzfV59SW4EjpvOxfu9fa3
 X3PuSejDoahSifd4TtKm6n6CBSeMXgDCGrBVX+4FtujLVVT5njRNmje1+Fatz/maTRcS
 su/niMr6afNM3lJEX4Zc7lPui8pG5PlPaqIuTD/oXjnLUylwASI3gH7S9b3x/m+SRrDN
 8e8ZGz9tuaO7CmzPNs/qXhM9D9R1OXEIQMWEaWO+G5U7WkImd0eYRqJniXWDFcRxJCHW
 kdzw==
X-Gm-Message-State: APjAAAUu1H+1roHAIQRokRA4LhwsFHWjHwHHwlbo3E24yCE6yWAueKEk
 QkyufCWqRDo/Dw2JMu6wBA==
X-Google-Smtp-Source: APXvYqwxsOHf0eCMmkU5FDfUzE8g5eAjnd7zYHNf1mNs7HEBS8YeT4sL4wp4ZPy2y5mZa+0w7UHfDA==
X-Received: by 2002:a9d:6e12:: with SMTP id e18mr12968418otr.63.1574469274945; 
 Fri, 22 Nov 2019 16:34:34 -0800 (PST)
Received: from localhost (ip-70-5-93-147.ftwttx.spcsdns.net. [70.5.93.147])
 by smtp.gmail.com with ESMTPSA id a23sm2575394oia.41.2019.11.22.16.34.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2019 16:34:34 -0800 (PST)
Date: Fri, 22 Nov 2019 18:34:32 -0600
From: Rob Herring <robh@kernel.org>
To: Adrian Ratiu <adrian.ratiu@collabora.com>
Message-ID: <20191123003432.GA334@bogus>
References: <20191118152518.3374263-1-adrian.ratiu@collabora.com>
 <20191118152518.3374263-5-adrian.ratiu@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191118152518.3374263-5-adrian.ratiu@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, Martyn Welch <martyn.welch@collabora.com>,
 Sjoerd Simons <sjoerd.simons@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-imx@nxp.com, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 4/4] dt-bindings: display: add IMX MIPI
 DSI host controller doc
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

On Mon, Nov 18, 2019 at 05:25:18PM +0200, Adrian Ratiu wrote:
> Signed-off-by: Sjoerd Simons <sjoerd.simons@collabora.com>
> Signed-off-by: Martyn Welch <martyn.welch@collabora.com>
> Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
> ---
>  .../bindings/display/imx/mipi-dsi.txt         | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/mipi-dsi.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/imx/mipi-dsi.txt b/Documentation/devicetree/bindings/display/imx/mipi-dsi.txt
> new file mode 100644
> index 000000000000..3f05c32ef963
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/imx/mipi-dsi.txt
> @@ -0,0 +1,56 @@
> +Freescale i.MX6 DW MIPI DSI Host Controller
> +===========================================
> +
> +The DSI host controller is a Synopsys DesignWare MIPI DSI v1.01 IP
> +with a companion PHY IP.
> +
> +These DT bindings follow the Synopsys DW MIPI DSI bindings defined in
> +Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt with
> +the following device-specific properties.
> +
> +Required properties:
> +
> +- #address-cells: Should be <1>.
> +- #size-cells: Should be <0>.
> +- compatible: "fsl,imx6q-mipi-dsi", "snps,dw-mipi-dsi".
> +- reg: See dw_mipi_dsi.txt.
> +- interrupts: The controller's CPU interrupt.
> +- clocks, clock-names: Phandles to the controller's pll reference
> +  clock(ref) and APB clock(pclk), as described in [1].
> +- ports: a port node with endpoint definitions as defined in [2].
> +- gpr: Should be <&gpr>.

fsl,gpr

> +       Phandle to the iomuxc-gpr region containing the multiplexer
> +       control register.
> +
> +[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
> +[2] Documentation/devicetree/bindings/media/video-interfaces.txt
> +
> +Example:
> +
> +	mipi_dsi: mipi@21e0000 {

dsi@...

> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		compatible = "fsl,imx6q-mipi-dsi", "snps,dw-mipi-dsi";
> +		reg = <0x021e0000 0x4000>;
> +		interrupts = <0 102 IRQ_TYPE_LEVEL_HIGH>;
> +		gpr = <&gpr>;
> +		clocks = <&clks IMX6QDL_CLK_MIPI_CORE_CFG>,
> +			 <&clks IMX6QDL_CLK_MIPI_IPG>;
> +		clock-names = "ref", "pclk";
> +		status = "okay";

Don't show status in examples.

> +
> +		ports {
> +			port@0 {
> +				reg = <0>;
> +				mipi_mux_0: endpoint {
> +					remote-endpoint = <&ipu1_di0_mipi>;
> +				};
> +			};
> +			port@1 {
> +				reg = <1>;
> +				mipi_mux_1: endpoint {
> +					remote-endpoint = <&ipu1_di1_mipi>;
> +				};
> +			};
> +		};
> +        };
> -- 
> 2.24.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
