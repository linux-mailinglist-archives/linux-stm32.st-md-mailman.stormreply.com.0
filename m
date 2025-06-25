Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16452AE8CAD
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Jun 2025 20:39:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4BC47C32EB5;
	Wed, 25 Jun 2025 18:39:52 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A4D54C32EB0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jun 2025 18:39:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 943A3A52B38;
 Wed, 25 Jun 2025 18:39:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D290C4CEEA;
 Wed, 25 Jun 2025 18:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750876789;
 bh=Ne3gQDGNR+fc9eT5DJJdL5V8H/ySv24dUclSgAsgI3I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G8RXNkr5OwQEpMXK4RtS9V68i1Qvq4HEAJav6fuIAKALQUxJMU6tKWh8NO6ushrn5
 zCRTdqWH7DdODZySzkau7PCNaDBXcOw9jmstHn4bOYi5csSpCSFM4zvV+iOBhFjTI7
 iMocPlkq/T3MltzRWEZw4xMK9+ux8p79GjOx0pjCXPFruteFC7LB3WkubdO19Wvcy7
 deizZzbng8niI2ibvLX4zNp4sY3BOftfvri48XQNigiT5B5Q6xmer8ILjjschjt08f
 hxvb5jJlH6iJGfUuCIqFXOG8f1LMqC/ntianHDZzsH+pIK3Ea7XfCx/NA7a5G4oyRL
 /P0ol9R0EwZJw==
Date: Wed, 25 Jun 2025 13:39:48 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Message-ID: <175087678758.1997493.17415728035364820579.robh@kernel.org>
References: <20250603-stm32mp157f-dk2-v2-0-5be0854a9299@foss.st.com>
 <20250603-stm32mp157f-dk2-v2-3-5be0854a9299@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250603-stm32mp157f-dk2-v2-3-5be0854a9299@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Pascal Paillet <p.paillet@foss.st.com>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 3/7] dt-bindings: regulator: Add
 STM32MP15 SCMI regulator identifiers
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


On Tue, 03 Jun 2025 11:02:09 +0200, Amelie Delaunay wrote:
> From: Etienne Carriere <etienne.carriere@foss.st.com>
> 
> These bindings will be used for the SCMI voltage domain.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
> Signed-off-by: Pascal Paillet <p.paillet@foss.st.com>
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> 
> ---
> Changes in v2:
> - Add external regulators and Pascal's SoB
> ---
>  .../dt-bindings/regulator/st,stm32mp15-regulator.h | 40 ++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
