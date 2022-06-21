Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA2A55346B
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Jun 2022 16:23:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3DA44C5E2C6;
	Tue, 21 Jun 2022 14:23:25 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8E7CC56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jun 2022 14:23:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4BC30B817C7;
 Tue, 21 Jun 2022 14:23:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0FBFC3411C;
 Tue, 21 Jun 2022 14:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1655821402;
 bh=/7FHu/l1P2AIpjzv1z9rW00tsNnYYhYf7Z3/9CtVBlQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r77Y8UbJMdEM3NMc6q4lW0erRfnRQ+oZlU55aji2tP5hf/74PGWUSvRUhveaAoZMM
 dT4kymsdwPSXz723uWyKJThFv4YEi07+N+OW5JGT2oV436sPZRhAN/obp2A+vT9k6R
 7PuzlLTk7/pa+yFHPfevNuY/HCA1Gtm9pdIddA6c=
Date: Tue, 21 Jun 2022 16:23:19 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <YrHUV2MeCQ0vAnfd@kroah.com>
References: <20220621130506.85424-1-fabrice.gasnier@foss.st.com>
 <20220621130506.85424-2-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220621130506.85424-2-fabrice.gasnier@foss.st.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stern@rowland.harvard.edu, hminas@synopsys.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/3] usb: host: ohci-platform: add TPL
	support
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

On Tue, Jun 21, 2022 at 03:05:04PM +0200, Fabrice Gasnier wrote:
> From: Amelie Delaunay <amelie.delaunay@foss.st.com>
> 
> The TPL support is used to identify targeted devices during EH compliance
> test. The user can add "tpl-support" in the device tree to enable it.

What is "TPL" support?  What is "EH"?

Please spell things out.

thanks,

greg k-h
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
