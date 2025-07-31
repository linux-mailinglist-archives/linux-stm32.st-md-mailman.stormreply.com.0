Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5591FB1727B
	for <lists+linux-stm32@lfdr.de>; Thu, 31 Jul 2025 15:52:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1401FC3F938;
	Thu, 31 Jul 2025 13:52:50 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69C12C3F933
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Jul 2025 13:52:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 69D6CA55075;
 Thu, 31 Jul 2025 13:52:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E69D7C4CEEF;
 Thu, 31 Jul 2025 13:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753969967;
 bh=XdzNgiFrq59/+bhLTk3tmfCHWzWelXvJVRNyC573BUU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sfrGE2XjpbFnGJ4vZ2vCSUn4m0X1yMDzIzKdb/bOuAc4BemdM0NnaN8PrBSP1LZpp
 q6Kz3ikx8T6953wCUG/S7HKiVL9R1mk87ZfE1MU0R+RQHHIYgp4OXhIjSFio9yKhbN
 MA/ccfQtI8HsmS5xBsIxtQ22DH6gkPdWYKhL+tXU/9cGmRAzsH9dmPqIwzWcxlqQn6
 wQ5Uz8WpWl3EQeVdwjs9rSyIg2yFXJfh87CrW374TtX96gS4wRWZKB9YR8VhUsla2r
 xbj0S4w2UXYPqaS9a5eiBk/uGegJgJ3zoOD6anzlI19S8ZvSNDbkzyBGFPwBsCoPoY
 O9et9Z1d+V65g==
Date: Thu, 31 Jul 2025 08:52:46 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
Message-ID: <175396996558.2138050.15303219446364860423.robh@kernel.org>
References: <20250728-ddrperfm-upstream-v5-0-03f1be8ad396@foss.st.com>
 <20250728-ddrperfm-upstream-v5-8-03f1be8ad396@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250728-ddrperfm-upstream-v5-8-03f1be8ad396@foss.st.com>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-doc@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Will Deacon <will@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Jonathan Corbet <corbet@lwn.net>, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Le Goffic <legoffic.clement@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Julius Werner <jwerner@chromium.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v5 08/20] dt-binding: memory: add DDR4
	channel compatible
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


On Mon, 28 Jul 2025 17:29:39 +0200, Cl=E9ment Le Goffic wrote:
> Add in the memory channel binding the DDR4 compatible to support DDR4
> memory channel.
> =

> Signed-off-by: Cl=E9ment Le Goffic <clement.legoffic@foss.st.com>
> ---
>  .../bindings/memory-controllers/ddr/jedec,sdram-channel.yaml   | 10 ++++=
++++++
>  1 file changed, 10 insertions(+)
> =


Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
