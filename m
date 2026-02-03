Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NSLAKvZgWlBLQMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 03 Feb 2026 12:19:07 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 88130D82A3
	for <lists+linux-stm32@lfdr.de>; Tue, 03 Feb 2026 12:19:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 373A4C87EC6;
	Tue,  3 Feb 2026 11:19:06 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E95D3C0693E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Feb 2026 11:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770117543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2WnKseKgzuDEwEZ2TxAar2LzO8o7OZlfDBwq/L+OXzI=;
 b=SPK7J5boZRP8L6xLuwUZBZHzncrT0hBtqcErHjGeqw/ZpYpmsfsNcLrPBuN7jBiSgAVsky
 UAEhQk6aN1aC0ymO284r0EUwV6HgiI4qxSqB4yL9MenJfvLXtqkphWu24H/iQSe3U7ypHo
 MZGFLZoTIrWEpmU7HR231djFaNDlbH4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-pzGw8djGNaSqRoxZLdK4CA-1; Tue, 03 Feb 2026 06:19:02 -0500
X-MC-Unique: pzGw8djGNaSqRoxZLdK4CA-1
X-Mimecast-MFC-AGG-ID: pzGw8djGNaSqRoxZLdK4CA_1770117541
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4806b12ad3fso47031725e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 03 Feb 2026 03:19:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770117541; x=1770722341;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2WnKseKgzuDEwEZ2TxAar2LzO8o7OZlfDBwq/L+OXzI=;
 b=vLV0HcDrMkZLXnO4AnvrG0eYQ8Z2atfO+qipmtBS94RImlxGgv2tHMueCDJdXzehn8
 6+8W8eGjoZ4oAu5BF0JbRCpdmqcUVku9ZK1nbrG/N1M/tHrwlIgkj4/airuNvYm8DstN
 LW90gJhOa18GOimzlrTyCE4YTX+pdXfy+6pZZJiKcxE7SuoZ6Vnmty790NMNpYX6Z8Yt
 +jW1s7UlU9Fp/mfcuPUqzx/JbmBCk7JNQ/a1quUevBuK7c3yqYA+pUoezCdq1SEnkN/B
 zPBpgBeTL1fWhkjtq8oyIQL8xhLJhfSMrRgtfPSqB1NtGF6a+wGCDiNwxeq1WOh07Y2i
 g74g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOOxYhr0zcSeOT12KOYBBsXe1mxZDJX64spImbYK133/UbsnwMwE0cHfU11931/sClRW0fq+SRzxqcdg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy6dcbkFpjxt6VF/g4V7mAz2urpQAPErioAApJ6mrMquE6QKZ5A
 9I3GL2aLL5XwJUEognc6tcNO3ttShnG1hyDinj/Au0WyI/9s7CrOJrwWTdra4Rbc02F8++jnPB/
 ydmRKr5F9UUcVsXhi7WsKCGSQbY5ImWBYiH6oD9yChfcgy+UsKN2zmgteBkGGb9DLakjodmeaFK
 4q3P/uMA==
X-Gm-Gg: AZuq6aJ1eyeBDW8mY/tzHnhxKEi2+Vrbi1I28L+Y5J6WD9+t4IntzhditCcn2DuwVeg
 JwAmxhPUGIDeCdiokHTdHVqshqDmhiyq3zpnCumRI9ygzet3OvPV3AkS1mStQLQSVyEcOTB1SGI
 btAuTLPhVaIFDN6eqS/WhtlsdbSzF7Yzu5WOO6o+v5T5nTEUeDMARS7taD1MC39H39TtntOyyNq
 gkO/k91P3mUdmZLI6eVOgmIYvotfbz54yF7iUtnFgMdOIUBUoiNA+SalwK3DbO7gjGGj2PaWi68
 5dkVKV9H6Q8wwKji+w/QeZVje0E+1uIZvpMzdaF4MO0g8ZQWO5VQcs//R+1mk6ETLOKqoVTgHm1
 DIHD5uzYUVGE=
X-Received: by 2002:a05:600c:a087:b0:479:35e7:a0e3 with SMTP id
 5b1f17b1804b1-482db48f2ccmr209555395e9.30.1770117541303; 
 Tue, 03 Feb 2026 03:19:01 -0800 (PST)
X-Received: by 2002:a05:600c:a087:b0:479:35e7:a0e3 with SMTP id
 5b1f17b1804b1-482db48f2ccmr209554895e9.30.1770117540850; 
 Tue, 03 Feb 2026 03:19:00 -0800 (PST)
Received: from [192.168.88.32] ([150.228.93.21])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-482dbc7f580sm149384895e9.2.2026.02.03.03.18.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Feb 2026 03:19:00 -0800 (PST)
Message-ID: <bdb7cd69-7dcd-4e8a-b04a-14a2eb902311@redhat.com>
Date: Tue, 3 Feb 2026 12:18:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Chester Lin <chester62515@gmail.com>
References: <cover.1769764941.git.dan.carpenter@linaro.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <cover.1769764941.git.dan.carpenter@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: o0CY06QKFiSbUt8olK-EPoCQWfNal-n3gdkYwerafdg_1770117541
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>,
 Frank Li <Frank.Li@nxp.com>, Eric Dumazet <edumazet@google.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 linaro-s32@linaro.org, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jan Petrous <jan.petrous@oss.nxp.com>,
 linux-arm-kernel@lists.infradead.org, Matthias Brugger <mbrugger@suse.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v6 0/3] s32g: Use a syscon for GPR
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[redhat.com : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[redhat.com:s=mimecast20190719];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dan.carpenter@linaro.org,m:chester62515@gmail.com,m:imx@lists.linux.dev,m:s32@nxp.com,m:Frank.Li@nxp.com,m:edumazet@google.com,m:ghennadi.procopciuc@oss.nxp.com,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:kuba@kernel.org,m:linaro-s32@linaro.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:s.hauer@pengutronix.de,m:jan.petrous@oss.nxp.com,m:linux-arm-kernel@lists.infradead.org,m:mbrugger@suse.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:kernel@pengutronix.de,m:krzk+dt@kernel.org,m:davem@davemloft.net,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:andrew@lunn.ch,m:krzk@kernel.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_CC(0.00)[lists.linux.dev,nxp.com,google.com,oss.nxp.com,gmail.com,st-md-mailman.stormreply.com,kernel.org,linaro.org,vger.kernel.org,pengutronix.de,lists.infradead.org,suse.com,lunn.ch,davemloft.net];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[pabeni@redhat.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pabeni@redhat.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,linux.dev:email]
X-Rspamd-Queue-Id: 88130D82A3
X-Rspamd-Action: no action

On 1/30/26 2:19 PM, Dan Carpenter wrote:
> The s32g devices have a GPR register region which holds a number of
> miscellaneous registers.  Currently only the stmmac/dwmac-s32.c uses
> anything from there and we just add a line to the device tree to
> access that GMAC_0_CTRL_STS register:
> 
>                         reg = <0x4033c000 0x2000>, /* gmac IP */
>                               <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
> 
> I have included the whole list of registers below.
> 
> We still have to maintain backwards compatibility to this format,
> of course, but it would be better to access these registers through a
> syscon.  Putting all the registers together is more organized and shows
> how the hardware actually is implemented.
> 
> Secondly, in some versions of this chipset those registers can only be
> accessed via SCMI.  It's relatively straight forward to handle this
> by writing a syscon driver and registering it with of_syscon_register_regmap()
> but it's complicated to deal with if the registers aren't grouped
> together.
> 
> Changes since v5:
> * Fix O vs 0 typo in yaml file
> * Add Jan Petrous's Reviewed-by tag
> 
> Changes since v4:
> * Return an error if regmap_write() fails
> * Add Rob's Reviewed-by tag to the yaml patch
> 
> Changes since v3:
> * Fix the yaml file format
> * Add netdev to the CC list on all emails so the CI triggers
> 
> Changes since v2:
> * Improve the documentation in .../bindings/net/nxp,s32-dwmac.yaml
> * "[PATCH v2 2/4] dt-bindings: mfd: syscon: Document the GPR syscon
>   for the NXP S32 SoCs" was applied so drop it.
> 
> Changes since v1:
> * Add imx@lists.linux.dev to the CC list.
> * Fix forward porting bug.  s/PHY_INTF_SEL_RGMII/S32_PHY_INTF_SEL_RGMII/
> * Use the correct SoC names nxp,s32g2-gpr and nxp,s32g3-gpr instead of
>   nxp,s32g-gpr which is the SoC family.
> * Fix the phandle name by adding the vendor prefix
> * Fix the documentation for the phandle
> * Remove #address-cells and #size-cells from the syscon block
> 
> Here is the whole list of registers in the GPR region
> 
> Starting from 0x4007C000
> 
> 0  Software-Triggered Faults (SW_NCF)
> 4  GMAC Control (GMAC_0_CTRL_STS)
> 28 CMU Status 1 (CMU_STATUS_REG1)
> 2C CMUs Status 2 (CMU_STATUS_REG2)
> 30 FCCU EOUT Override Clear (FCCU_EOUT_OVERRIDE_CLEAR_REG)
> 38 SRC POR Control (SRC_POR_CTRL_REG)
> 54 GPR21 (GPR21)
> 5C GPR23 (GPR23)
> 60 GPR24 Register (GPR24)
> CC Debug Control (DEBUG_CONTROL)
> F0 Timestamp Control (TIMESTAMP_CONTROL_REGISTER)
> F4 FlexRay OS Tick Input Select (FLEXRAY_OS_TICK_INPUT_SELECT_REG)
> FC GPR63 Register (GPR63)
> 
> Starting from 0x4007CA00
> 
> 0  Coherency Enable for PFE Ports (PFE_COH_EN)
> 4  PFE EMAC Interface Mode (PFE_EMACX_INTF_SEL)
> 20 PFE EMACX Power Control (PFE_PWR_CTRL)
> 28 Error Injection on Cortex-M7 AHB and AXI Pipe (CM7_TCM_AHB_SLICE)
> 2C Error Injection AHBP Gasket Cortex-M7 (ERROR_INJECTION_AHBP_GASKET_CM7)
> 40 LLCE Subsystem Status (LLCE_STAT)
> 44 LLCE Power Control (LLCE_CTRL)
> 48 DDR Urgent Control (DDR_URGENT_CTRL)
> 4C FTM Global Load Control (FLXTIM_CTRL)
> 50 FTM LDOK Status (FLXTIM_STAT)
> 54 Top CMU Status (CMU_STAT)
> 58 Accelerator NoC No Pending Trans Status (NOC_NOPEND_TRANS)
> 90 SerDes RD/WD Toggle Control (PCIE_TOGGLE)
> 94 SerDes Toggle Done Status (PCIE_TOGGLEDONE_STAT)
> E0 Generic Control 0 (GENCTRL0)
> E4 Generic Control 1 (GENCTRL1)
> F0 Generic Status 0 (GENSTAT0)
> FC Cortex-M7 AXI Parity Error and AHBP Gasket Error Alarm (CM7_AXI_AHBP_GASKET_ERROR_ALARM)
> 
> Starting from 4007C800
> 
> 4  GPR01 Register (GPR01)
> 30 GPR12 Register (GPR12)
> 58 GPR22 Register (GPR22)
> 70 GPR28 Register (GPR28)
> 74 GPR29 Register (GPR29)
> 
> Starting from 4007CB00
> 
> 4 WKUP Pad Pullup/Pulldown Select (WKUP_PUS)
> 
> Dan Carpenter (3):
>   net: stmmac: s32: use a syscon for S32_PHY_INTF_SEL_RGMII
>   dt-bindings: net: nxp,s32-dwmac: Use the GPR syscon
>   dts: s32g: Add GPR syscon region

It looks like patch 3/3 depends on 1/3 but it should land in a different
tree, as patches 1 && 2 looks suitable for 'net-next' and 3/3 should
probably go via the arm/freescale tree.

We either need explicit ack from freescale maintainers or this should be
split across subtrees, right?

Thanks,

Paolo

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
