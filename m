Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FE2C74B05
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Nov 2025 15:57:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9AA63C01FB5;
	Thu, 20 Nov 2025 14:57:06 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4BCD1C3F944
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Nov 2025 14:57:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3896260131;
 Thu, 20 Nov 2025 14:57:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFAC8C113D0;
 Thu, 20 Nov 2025 14:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763650623;
 bh=ZAWEhvuGNxLW528zSSPNsK40qVVkeMvPLNo31hKx7FU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a31r7nz53cyUEYwpuoTtq+Q9RJYSZkSl1zEN4oG+lYTBthELcNwkHF7oYMp0iZgPz
 K88gFCg+CatZvxK+BzgIPfiOswIfy+KVLcs/lFE/G7r65lmxzKy9UToz1njvtoY+nM
 eMdTTNSMrPVqi62uPPoN/gR2WltIcHPC9o2dexHw+EK85Lde0F/atyDeor5sbtBZML
 CLzPqRnpxk7bLY7/AcbMm0VVwI3AnqcNO9CQoZEw98KFHeEqoCo9695+2IeO0nnIRr
 jDkX4Brb7LKk9Z+a5mkoI2hAmLg2tGunwQOFV7C/H2HjK1gsfw0KehB2tgd2fo06Ar
 BCJLlF+filw1Q==
Date: Thu, 20 Nov 2025 08:57:02 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <legoffic.clement@gmail.com>
Message-ID: <176365062162.1254978.3113045721070075271.robh@kernel.org>
References: <20251118-b4-ddr-bindings-v9-0-a033ac5144da@gmail.com>
 <20251118-b4-ddr-bindings-v9-2-a033ac5144da@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251118-b4-ddr-bindings-v9-2-a033ac5144da@gmail.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Julius Werner <jwerner@chromium.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v9 2/7] dt-bindings: memory: introduce DDR4
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


On Tue, 18 Nov 2025 16:07:58 +0100, Cl=E9ment Le Goffic wrote:
> From: Cl=E9ment Le Goffic <clement.legoffic@foss.st.com>
> =

> Introduce JEDEC compliant DDR bindings, that use new memory-props binding.
> =

> The DDR4 compatible can be made of explicit vendor names and part
> numbers or be of the form "ddrX-YYYY,AAAA...-ZZ" when associated with an
> SPD, where (according to JEDEC SPD4.1.2.L-6):
> - YYYY is the manufacturer ID
> - AAAA... is the part number
> - ZZ is the revision ID
> =

> The former form is useful when the SDRAM vendor and part number are
> known, for example, when memory is soldered on the board.
> The latter form is useful when SDRAM nodes are created at runtime by
> boot firmware that doesn't have access to static part number information.
> =

> Signed-off-by: Cl=E9ment Le Goffic <clement.legoffic@foss.st.com>
> Signed-off-by: Cl=E9ment Le Goffic <legoffic.clement@gmail.com>
> ---
>  .../memory-controllers/ddr/jedec,ddr4.yaml         | 34 ++++++++++++++++=
++++++
>  1 file changed, 34 insertions(+)
> =


Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
