Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E942459B87
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Nov 2021 06:19:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1BFCBC5C82A;
	Tue, 23 Nov 2021 05:19:40 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4DB1C597BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Nov 2021 05:19:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6A1876044F;
 Tue, 23 Nov 2021 05:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637644777;
 bh=s2+X/Dsn5egmAanzElg2iQu3D1op/8JYzqhkY6R0B1c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S9F3pH7NnisPh1/tnsyZYJgedv5MHzvlgFsyY/u03a5Kxf023659hbCitgJnJ7+9P
 83Evkqb+lC/eA5daxdJyr+IAJyarDjBL2GLZZ8zjrOC6n7yBfV5SLGNsvihxLEOayR
 5yGKyHtN5jMyXrN+oI4clFAS2/4PRNmokc8aG73bvQY3gNCEx6HtgbaCAHSNfyhSec
 2l/oFM/TlykQ6frdZY2IaN5Jh/zQkkVKeJo6seG1STEtYFy6/F32E3CdlNkVz+4O4E
 XC4/KiQ2nP8++/909qWvZi/FCdZfy/2OSooZNUY2Q5dTiyyXsuBEACqznbjt58kb4J
 OCBr6QQ+d7C3w==
Date: Tue, 23 Nov 2021 10:49:32 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <YZx55MrlupRxNpMx@matsya>
References: <1635172265-26219-1-git-send-email-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1635172265-26219-1-git-send-email-fabrice.gasnier@foss.st.com>
Cc: linux-kernel@vger.kernel.org, alexandre.torgue@foss.st.com, kishon@ti.com,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] phy: stm32: adopt dev_err_probe for
	regulators
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

On 25-10-21, 16:31, Fabrice Gasnier wrote:
> Change stm32-usbphyc driver to use dev_err_probe(), to benefit of
> devices_deferred debugfs in case of probe deferral.

Applied, thanks

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
