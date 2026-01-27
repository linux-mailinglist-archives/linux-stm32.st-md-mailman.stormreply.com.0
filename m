Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPPWLj4ceGnooAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jan 2026 03:00:30 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C1C8ED64
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jan 2026 03:00:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00799C36B13;
	Tue, 27 Jan 2026 02:00:30 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66D5BC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jan 2026 02:00:28 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2a102494058so29160735ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Jan 2026 18:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769479227; x=1770084027;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:from:content-language:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hyo+erR00h9458p7uQWXt34pYACkPr3IjWEnwDWvgac=;
 b=kcM0mJX1BEem24RLsl6xgoSpyxY6hCPwcEkOIe3xmij98n6toAwQ1JIZxHxrGdd8JY
 IkqXoPTxJZUGytGr3x5FjqmnxpQP61ClA7Yy9f9kJtxci5Oky+4SLbI7oWTRYclcfZz4
 slE0k30Yi1fysuyBt2joK28iibffOQislFyKIe0EnGLbCI4pUfp5UYK/16cCqXyJQhqX
 k78KTb63IDj4+CWAKCEziDrZWDxzexXO5dRUyN1bTK7Gcy0lbLEfK46X5JlB6HYNUKlP
 H14PhxiFMtKP89DWKwF/5kQExXtKaJk2On26cu5Jv9AnarD1FCXeEFWvCTvW0hBECx5O
 /SAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769479227; x=1770084027;
 h=in-reply-to:from:content-language:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Hyo+erR00h9458p7uQWXt34pYACkPr3IjWEnwDWvgac=;
 b=jJN5edzAb5Dhw6ingNHuJj60NuzAKicXPmd0LA/1+38wGW1WQdRiYtIA71y1jniaz7
 sjfmtZUp3ZcIyPY6WPDNxE9RMTkN5xkZ/2/2n4WJB012///c0y21hLkTKgD+VeW6eUNi
 4cwd2RJONFTihkprZA1bbrzhUhpQHNpI4cEsCt1yiDGJMu1nl5mf0HtaqGBlu4Uv4Xli
 yL2BJGxavTTeEvuoZ9hnxmopUptLm83nhcm/bJ0FGyNKZL5XdweZsh4nQV8UCDbErSpG
 TIUSAWxv+sBPlJuvc0vVbsWHN4BfAwnx6yGVt2rMJAqWLWzhCO2Fgupzd5fz5J2ORyPl
 k1Hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4etVeyzUh68MTbE+oa/6NiUF6508pqkgf7/1ou4tPeQCc9/BX2AvXzE3wtCTiTnINjVb+JjJxyLm+Ww==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxFpG4evilfR909A/YvnbwIkCUP7NCx3V/QSlGvE7jSUXVsR61t
 mIuSNehgL9ChpMIGePoCiM7WCtmvbebNPXUZjx+dLGGWoCQOQnapA0sL
X-Gm-Gg: AZuq6aKff7Qb4U7eBELDz+osy2HDJczzFmCxFWK1TIuDk6BTL/rohnSgyoLMVsF1W5s
 yZdbR7wSa1kE00L6rk+AUIhfGqmVfUQSWHZmhJ7s1TDH12HkHsiVbqVXgGB/3aL93D5LgauzqCF
 lN5qBc8PRassVCDEAOXZ6uguu5sw8rNpU1D5SfmmrHTighHKi5Wb5iNj1h0muMVvVx47x41qou+
 MAriYTZoqVHiHenGIjrvt57LQhpBkj4aYDJCD7aQBcysU2HLu+8vpoYJC8lLydbE1p7S3ArTLmG
 ZzRDBRqua2LWH2OMsK/AW6ZcHew/w99v3n1B4z+0Yc9HZFrK5OVgfbT2cV1PJjgMRAalKNnJnU1
 nwrsUQIVjWO9frQOUZRAcWFPfPVwqO3Wxd6Sgs6xVdvKPOD54L1bWCst1svbh3B3/vEzCyng1FI
 2o9w+vnOUYpLAvL06Xmq0SVpac5uOz4Lj5cscI0mq5utODMqHoilOX+4xsHUwnNJ6jpvpMhyBYz
 n4=
X-Received: by 2002:a17:903:2f91:b0:2a0:f0e5:74eb with SMTP id
 d9443c01a7336-2a87134d275mr388575ad.28.1769479226354; 
 Mon, 26 Jan 2026 18:00:26 -0800 (PST)
Received: from [192.168.0.102] (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a802fb0262sm99857235ad.70.2026.01.26.18.00.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jan 2026 18:00:25 -0800 (PST)
Message-ID: <52a6417f-66bc-46cb-b9b8-66d58da95a34@gmail.com>
Date: Tue, 27 Jan 2026 10:00:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <20260126102257.2619862-1-a0987203069@gmail.com>
 <20260126102257.2619862-3-a0987203069@gmail.com>
 <ea3a1f85-0f27-498c-b03b-110456a751da@lunn.ch>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <ea3a1f85-0f27-498c-b03b-110456a751da@lunn.ch>
Cc: ychuang3@nuvoton.com, edumazet@google.com, schung@nuvoton.com,
 yclu4@nuvoton.com, linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 openbmc@lists.ozlabs.org, joabreu@synopsys.com, kuba@kernel.org,
 pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 richardcochran@gmail.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, mcoquelin.stm32@gmail.com,
 krzk+dt@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v9 2/3] arm64: dts: nuvoton: Add
	Ethernet nodes
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
Content-Type: multipart/mixed; boundary="===============3731404081477861874=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[multipart/mixed,multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[a0987203069@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:ychuang3@nuvoton.com,m:edumazet@google.com,m:schung@nuvoton.com,m:yclu4@nuvoton.com,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:openbmc@lists.ozlabs.org,m:joabreu@synopsys.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:peppe.cavallaro@st.com,m:linux-arm-kernel@lists.infradead.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:davem@davemloft.net,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	FREEMAIL_CC(0.00)[nuvoton.com,google.com,st-md-mailman.stormreply.com,kernel.org,lists.ozlabs.org,synopsys.com,redhat.com,vger.kernel.org,gmail.com,st.com,lists.infradead.org,lunn.ch,davemloft.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DBL_PROHIBIT(0.00)[2.100.46.192:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[a0987203069@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[gmail.com:-];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,stm-ict-prod-mailman-01.stormreply.prv:helo,0.0.0.1:email,st-md-mailman.stormreply.com:rdns,2.111.199.128:email]
X-Rspamd-Queue-Id: 43C1C8ED64
X-Rspamd-Action: no action

This is a multi-part message in MIME format.
--===============3731404081477861874==
Content-Type: multipart/alternative;
 boundary="------------WtKhOJP16ntJfHx0PNQbJ409"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------WtKhOJP16ntJfHx0PNQbJ409
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


> On Mon, Jan 26, 2026 at 06:22:56PM +0800, Joey Lu wrote:
>> Add GMAC nodes for our MA35D1 development boards:
>> two RGMII interfaces for SOM board, and one RGMII
>> and one RMII interface for IoT board.
>>
>> Signed-off-by: Joey Lu<a0987203069@gmail.com>
>> ---
>>   .../boot/dts/nuvoton/ma35d1-iot-512m.dts      | 33 +++++++++++++++++++
>>   .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 32 ++++++++++++++++++
>>   arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 32 ++++++++++++++++++
> Did you answer my question about what these represent?
>
> I _think_ your .dts{i} files are all messed up and need
> re-architecturing.
>
> arch/arm64/boot/dts/nuvoton/ma35d1.dtsi should represent the SoC.
>
> There should be a .dtsi file which represents everything on the SOM.
> This includes the SoC .dtsi file.
>
> There should be a .dts file for the carrier board. It should include
> the SOM .dtsi file.
>
> You said one of the boards does not use the SOM, so it can directly
> import the SoC .dtsi file.
>
>>   3 files changed, 97 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
>> index 9482bec1aa57..ee32cedf3d9b 100644
>> --- a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
>> +++ b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
>> @@ -18,6 +18,8 @@ aliases {
>>   		serial12 = &uart12;
>>   		serial13 = &uart13;
>>   		serial14 = &uart14;
>> +		ethernet0 = &gmac0;
>> +		ethernet1 = &gmac1;
>>   	};
>>   
>>   	chosen {
>> @@ -126,3 +128,34 @@ &uart14 {
>>   	pinctrl-0 = <&pinctrl_uart14>;
>>   	status = "okay";
>>   };
>> +
>> +&gmac0 {
>> +	phy-handle = <&eth_phy0>;
> This is a .dts file, so represents a board. You said the PHYs are on
> the board, not the SOM. So this is correct.
>
>
>> +	status = "okay";
>> +
>> +	mdio0: mdio {
>> +		compatible = "snps,dwmac-mdio";
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
> The MDIO bus is a property of the SoC. It always exists, even if it is
> not used. So the mdio node should be in the SoC .dtsi file.
>
>> +		eth_phy0: ethernet-phy@0 {
>> +			reg = <0>;
>> +		};
> The PHY is a property of the board, so should be in the board .dts
> file.
>
>> +	};
>> +};
>> +
>> +&gmac1 {
>> +	phy-mode = "rmii";
>> +	phy-handle = <&eth_phy1>;
>> +	status = "okay";
> Correct.
>
>> +
>> +	mdio1: mdio {
>> +		compatible = "snps,dwmac-mdio";
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
> Wrong.
>
>> +
>> +		eth_phy1: ethernet-phy@1 {
>> +			reg = <1>;
>> +		};
> Correct.
>
>> +	};
>> +};
>> diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
>> index f6f20a17e501..b1b3e45280d5 100644
>> --- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
>> +++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
>> @@ -18,6 +18,8 @@ aliases {
>>   		serial12 = &uart12;
>>   		serial14 = &uart14;
>>   		serial16 = &uart16;
>> +		ethernet0 = &gmac0;
>> +		ethernet1 = &gmac1;
>>   	};
>>   
>>   	chosen {
>> @@ -129,3 +131,33 @@ &uart16 {
>>   	pinctrl-0 = <&pinctrl_uart16>;
>>   	status = "okay";
>>   };
>> +
>> +&gmac0 {
>> +	phy-handle = <&eth_phy0>;
>> +	status = "okay";
>> +
>> +	mdio0: mdio {
>> +		compatible = "snps,dwmac-mdio";
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		eth_phy0: ethernet-phy@0 {
>> +			reg = <0>;
>> +		};
>> +	};
>> +};
>> +
>> +&gmac1 {
>> +	phy-handle = <&eth_phy1>;
>> +	status = "okay";
>> +
>> +	mdio1: mdio {
>> +		compatible = "snps,dwmac-mdio";
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		eth_phy1: ethernet-phy@1 {
>> +			reg = <1>;
>> +		};
>> +	};
>> +};
> Same problem as above.
>
>> --- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
>> +++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
> This represents the SoC.
>
>> @@ -379,5 +379,37 @@ uart16: serial@40880000 {
>>   			clocks = <&clk UART16_GATE>;
>>   			status = "disabled";
>>   		};
>> +
>> +		gmac0: ethernet@40120000 {
>> +			compatible = "nuvoton,ma35d1-dwmac";
>> +			reg = <0x0 0x40120000 0x0 0x10000>;
>> +			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names = "macirq";
>> +			clocks = <&clk EMAC0_GATE>, <&clk EPLL_DIV8>;
>> +			clock-names = "stmmaceth", "ptp_ref";
>> +
>> +			nuvoton,sys = <&sys 0>;
>> +			resets = <&sys MA35D1_RESET_GMAC0>;
>> +			reset-names = "stmmaceth";
>> +
>> +			phy-mode = "rgmii-id";
> PHY mode is a property of the board. The board might have extra long
> clock lines, so needs 'rgmii'. The board might use MII?
>
> Please think about the hierarchy.  SoC -> SoM -> board. Put the
> properties at the correct level.
>
>      Andrew
>
> ---
> pw-bot: cr

Thanks for the clear explanation. I understand now.

I’ll move the MDIO bus nodes to the SoC |.dtsi| and keep PHYs in the 
board |.dts| in the next revision.

Best regards,

Joey

--------------WtKhOJP16ntJfHx0PNQbJ409
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix"><br>
    </div>
    <blockquote type="cite"
      cite="mid:ea3a1f85-0f27-498c-b03b-110456a751da@lunn.ch">
      <pre wrap="" class="moz-quote-pre">On Mon, Jan 26, 2026 at 06:22:56PM +0800, Joey Lu wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Add GMAC nodes for our MA35D1 development boards:
two RGMII interfaces for SOM board, and one RGMII
and one RMII interface for IoT board.

Signed-off-by: Joey Lu <a class="moz-txt-link-rfc2396E" href="mailto:a0987203069@gmail.com">&lt;a0987203069@gmail.com&gt;</a>
---
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      | 33 +++++++++++++++++++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 32 ++++++++++++++++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 32 ++++++++++++++++++
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Did you answer my question about what these represent?

I _think_ your .dts{i} files are all messed up and need
re-architecturing.

arch/arm64/boot/dts/nuvoton/ma35d1.dtsi should represent the SoC.

There should be a .dtsi file which represents everything on the SOM.
This includes the SoC .dtsi file.

There should be a .dts file for the carrier board. It should include
the SOM .dtsi file.

You said one of the boards does not use the SOM, so it can directly
import the SoC .dtsi file.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> 3 files changed, 97 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
index 9482bec1aa57..ee32cedf3d9b 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
@@ -18,6 +18,8 @@ aliases {
 		serial12 = &amp;uart12;
 		serial13 = &amp;uart13;
 		serial14 = &amp;uart14;
+		ethernet0 = &amp;gmac0;
+		ethernet1 = &amp;gmac1;
 	};
 
 	chosen {
@@ -126,3 +128,34 @@ &amp;uart14 {
 	pinctrl-0 = &lt;&amp;pinctrl_uart14&gt;;
 	status = "okay";
 };
+
+&amp;gmac0 {
+	phy-handle = &lt;&amp;eth_phy0&gt;;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This is a .dts file, so represents a board. You said the PHYs are on
the board, not the SOM. So this is correct.


</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	status = "okay";
+
+	mdio0: mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = &lt;1&gt;;
+		#size-cells = &lt;0&gt;;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
The MDIO bus is a property of the SoC. It always exists, even if it is
not used. So the mdio node should be in the SoC .dtsi file.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+		eth_phy0: ethernet-phy@0 {
+			reg = &lt;0&gt;;
+		};
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
The PHY is a property of the board, so should be in the board .dts
file. 

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	};
+};
+
+&amp;gmac1 {
+	phy-mode = "rmii";
+	phy-handle = &lt;&amp;eth_phy1&gt;;
+	status = "okay";
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Correct.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
+	mdio1: mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = &lt;1&gt;;
+		#size-cells = &lt;0&gt;;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Wrong.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
+		eth_phy1: ethernet-phy@1 {
+			reg = &lt;1&gt;;
+		};
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Correct.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	};
+};
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index f6f20a17e501..b1b3e45280d5 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -18,6 +18,8 @@ aliases {
 		serial12 = &amp;uart12;
 		serial14 = &amp;uart14;
 		serial16 = &amp;uart16;
+		ethernet0 = &amp;gmac0;
+		ethernet1 = &amp;gmac1;
 	};
 
 	chosen {
@@ -129,3 +131,33 @@ &amp;uart16 {
 	pinctrl-0 = &lt;&amp;pinctrl_uart16&gt;;
 	status = "okay";
 };
+
+&amp;gmac0 {
+	phy-handle = &lt;&amp;eth_phy0&gt;;
+	status = "okay";
+
+	mdio0: mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = &lt;1&gt;;
+		#size-cells = &lt;0&gt;;
+
+		eth_phy0: ethernet-phy@0 {
+			reg = &lt;0&gt;;
+		};
+	};
+};
+
+&amp;gmac1 {
+	phy-handle = &lt;&amp;eth_phy1&gt;;
+	status = "okay";
+
+	mdio1: mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = &lt;1&gt;;
+		#size-cells = &lt;0&gt;;
+
+		eth_phy1: ethernet-phy@1 {
+			reg = &lt;1&gt;;
+		};
+	};
+};
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Same problem as above.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This represents the SoC.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -379,5 +379,37 @@ uart16: serial@40880000 {
 			clocks = &lt;&amp;clk UART16_GATE&gt;;
 			status = "disabled";
 		};
+
+		gmac0: ethernet@40120000 {
+			compatible = "nuvoton,ma35d1-dwmac";
+			reg = &lt;0x0 0x40120000 0x0 0x10000&gt;;
+			interrupts = &lt;GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH&gt;;
+			interrupt-names = "macirq";
+			clocks = &lt;&amp;clk EMAC0_GATE&gt;, &lt;&amp;clk EPLL_DIV8&gt;;
+			clock-names = "stmmaceth", "ptp_ref";
+
+			nuvoton,sys = &lt;&amp;sys 0&gt;;
+			resets = &lt;&amp;sys MA35D1_RESET_GMAC0&gt;;
+			reset-names = "stmmaceth";
+
+			phy-mode = "rgmii-id";
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
PHY mode is a property of the board. The board might have extra long
clock lines, so needs 'rgmii'. The board might use MII?

Please think about the hierarchy.  SoC -&gt; SoM -&gt; board. Put the
properties at the correct level.

    Andrew

---
pw-bot: cr</pre>
    </blockquote>
    <p data-start="206" data-end="258">Thanks for the clear explanation.
      I understand now.</p>
    <p></p>
    <p>I’ll move the MDIO bus nodes to the SoC <code data-start="766"
        data-end="773">.dtsi</code> and keep PHYs in the board <code
        data-start="801" data-end="807">.dts</code> in the next
      revision.</p>
    <p>Best regards,</p>
    <p>Joey<br>
    </p>
    <blockquote type="cite"
      cite="mid:ea3a1f85-0f27-498c-b03b-110456a751da@lunn.ch">
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------WtKhOJP16ntJfHx0PNQbJ409--

--===============3731404081477861874==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3731404081477861874==--
