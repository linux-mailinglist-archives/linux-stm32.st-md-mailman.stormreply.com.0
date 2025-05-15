Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 335E7AB7A86
	for <lists+linux-stm32@lfdr.de>; Thu, 15 May 2025 02:21:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0552C7A828;
	Thu, 15 May 2025 00:21:56 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B6D8C6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 May 2025 00:21:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3441AA4E37A;
 Thu, 15 May 2025 00:21:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7D6AC4CEE3;
 Thu, 15 May 2025 00:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747268514;
 bh=iZxb2jBSDnEKEW1l8qaYvCVJkwZAk7SAXLmlCJt7lxE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=giLgSzaBsrTSQmdRgRpUok5qVyhLCBeiG1y7Q+F9QOxdTyOHZSGu3wBBs5jdwmRQd
 Y/dEjgXDvwC9CKdCgvIwpnWGjd2lySS6TaDlfUZoknEMD5nBADd8fMm0OWh/9GZMr3
 iGncaotXhTW+6uDLr/woGh7OgWk4uDrKRUhY7gkhOW+51suO/j2DAR9hjm1wOXubmb
 DcC4Mb7wl/hrkhz9FTBcg0+CEFl022ZyX3G92G1cCXSJP6LiIGb80NkfAkeFbwUK4a
 yjHIb1AAzbqy+v/TYQ308zyorknRpWQqpR5F6WVe5/Ap3cOvld6RUk3efsGxU5fBdD
 BNpRuEqQCkY8Q==
From: William Breathitt Gray <wbg@kernel.org>
To: lee@kernel.org, ukleinek@kernel.org, alexandre.torgue@foss.st.com,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Thu, 15 May 2025 09:21:44 +0900
Message-ID: <174726846872.375413.17945727550032496363.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250110091922.980627-4-fabrice.gasnier@foss.st.com>
References: <20250110091922.980627-1-fabrice.gasnier@foss.st.com>
 <20250110091922.980627-4-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=630; i=wbg@kernel.org;
 h=from:subject:message-id; bh=OdGDVpoycRi9OLgJVrxFO0kSREUlcdbL9tUWTQlQjY0=;
 b=owGbwMvMwCW21SPs1D4hZW3G02pJDBmqxk0rK0SetGYe2/NbVNbk7vGd194rcnVfNZvmKK+fq
 uxzofRMRykLgxgXg6yYIkuv+dm7Dy6pavx4MX8bzBxWJpAhDFycAjCRrT2MDDMPdm3oZe7d43yL
 P/HuJlNRHv4LndeCOZdZimyW5v6+4gAjw4K73xwSPxzacXX6f0v3gChdga36XCHf71mdSLv1dbV
 /LDcA
X-Developer-Key: i=wbg@kernel.org; a=openpgp;
 fpr=8D37CDDDE0D22528F8E89FB6B54856CABE12232B
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-iio@vger.kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org, will@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org,
 William Breathitt Gray <wbg@kernel.org>
Subject: Re: [Linux-stm32] (subset) [PATCH v3 3/8] counter: stm32-timer-cnt:
	add support for stm32mp25
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


On Fri, 10 Jan 2025 10:19:17 +0100, Fabrice Gasnier wrote:
> Add support for STM32MP25 SoC. There are new counter modes that may be
> implemented in later. Still, use newly introduced compatible to handle
> this new HW variant and avoid being blocked with existing compatible
> in SoC dtsi file. Modes supported currently still remains compatible.
> New timer 20 has encoder capability, add it to the list.
> 
> 
> [...]

Applied, thanks!

[3/8] counter: stm32-timer-cnt: add support for stm32mp25
      commit: ace2cd11a27231efcb8a116a597edab2eef34957

Best regards,
-- 
William Breathitt Gray <wbg@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
