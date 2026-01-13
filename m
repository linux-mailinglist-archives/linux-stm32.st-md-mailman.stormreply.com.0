Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0008ED18FF3
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jan 2026 14:04:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7338C8F282;
	Tue, 13 Jan 2026 13:04:12 +0000 (UTC)
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63B59C0693D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jan 2026 13:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=k1; bh=7DPc
 02BPDXRCPlk55tE1zQ0yL7hZ4M+jB2XH8eiaI/I=; b=V+1h2I/iWdDQ7lWhEi2l
 9pJAtKZx+A6z/JC/8qe1ZTjaH2STVl1tsXNQ1KIX2ObdGT9BSYi4MCDq78mpqmPx
 5SQtOie9cfkkiG9X8CBwC+lCS/Gf2q1FyXTbSYE+4TcaDFbDe32ocmZZXjefETjF
 ahT8VBejvt3D6z050ICyY93HKlWeBwyhN0hZKQIwdh88FqKd4EI7gvt1sviqw2h2
 OejEjQS8cjiHsCd45kYAY+lTCAwhLqu8/HPAFZvzaNEKS2Y2H4pfx3wAcsVYVk9+
 qVsC6/DIoT3AD//boMi4BQobmP2E8+7hxyUKGtASFmqcsdWcBUP5Dvezz1/rYuJ2
 dA==
Received: (qmail 1687664 invoked from network); 13 Jan 2026 14:04:10 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 13 Jan 2026 14:04:10 +0100
X-UD-Smtp-Session: l3s3148p1@QnyfoERI7q0ujnvx
Date: Tue, 13 Jan 2026 14:04:09 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <aWZCyYc8QAY1LOtF@ninjato>
References: <20251215-stm32-i2c-mp2x-dt-updates-v1-0-2738a05a7af8@foss.st.com>
 <20251215-stm32-i2c-mp2x-dt-updates-v1-1-2738a05a7af8@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251215-stm32-i2c-mp2x-dt-updates-v1-1-2738a05a7af8@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/5] dt-bindings: i2c: st,
 stm32-i2c: add 'power-domains' property
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

On Mon, Dec 15, 2025 at 01:19:40PM +0100, Alain Volmat wrote:
> STM32 I2C may be in a power domain which is the case for the STM32MP2x
> based boards. Allow a single 'power-domains' entry for STM32 I2C.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

Applied to for-next, thanks!

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
