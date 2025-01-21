Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 655CEA17E82
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Jan 2025 14:08:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19502C01E99;
	Tue, 21 Jan 2025 13:08:56 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A799CCFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jan 2025 13:08:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2EE2040009;
 Tue, 21 Jan 2025 13:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737464928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Il75rMT0w7WTkKxYVfwvba2fwzPLmWHPL1i8BZIxLOA=;
 b=SMDboO55VeXLOhdnmLSX/T4/NgRLenuWdo3wC8VmF3yKhXnBb+H2k3FDKDDlCipf0foJqm
 NIPGdoTw4bCIE6Z+QjEPlKxN425MXs2+bmuVSKZNbrDTOPenmuF1xqoeK/MzlhYLwf2nGE
 MYdz978SMSg1YpvyiN1wPsUQNIIO7iWsD3ZDlYTuH1g7q/aJHj7Cjf2c9ijkYDjKPfxFia
 8dLDqtKxcTG8ca0X6G119mu6LVR6HBYCpS4izqstRRMZ8PhATz+hzx2AEGiwvTnbtmW7Jy
 /vNYZE32/MRATqTpKs03Aj6eA/r/woYAnM17C+fsBFGLjsgH/KAG4ZhM82joMA==
Date: Tue, 21 Jan 2025 14:08:40 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Yijie Yang <quic_yijiyang@quicinc.com>
Message-ID: <20250121140840.18f85323@device-291.home>
In-Reply-To: <20250121-dts_qcs615-v3-1-fa4496950d8a@quicinc.com>
References: <20250121-dts_qcs615-v3-0-fa4496950d8a@quicinc.com>
 <20250121-dts_qcs615-v3-1-fa4496950d8a@quicinc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: maxime.chevallier@bootlin.com
Cc: Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Vinod Koul <vkoul@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Konrad Dybcio <konradybcio@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 1/4] dt-bindings: net:
 ethernet-controller: Correct the definition of phy-mode
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

On Tue, 21 Jan 2025 15:54:53 +0800
Yijie Yang <quic_yijiyang@quicinc.com> wrote:

> Correct the definition of 'phy-mode' to reflect that RX and TX delays are
> added by the board, not the MAC, to prevent confusion and ensure accurate
> documentation.

That's not entirely correct though. The purpose of the RGMII variants
(TXID, RXID, ID) are mostly to know whether or not the PHY must add
internal delays. That would be when the MAC can't AND there's no PCB
delay traces. Some MAC can insert delays.

There's documentation here as well on that point :

https://elixir.bootlin.com/linux/v6.13-rc3/source/Documentation/networking/phy.rst#L82

So, MACs may insert delays. A modification for the doc, if needed,
would rather be :

-      # RX and TX delays are added by the MAC when required
+      # RX and TX delays are added by the MAC or PCB traces when required

Thanks,

Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
