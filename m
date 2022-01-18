Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA165492432
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Jan 2022 12:01:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67833C5C82B;
	Tue, 18 Jan 2022 11:01:07 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56E50C56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jan 2022 11:01:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 147EA612B9;
 Tue, 18 Jan 2022 11:01:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D21D2C00446;
 Tue, 18 Jan 2022 11:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1642503664;
 bh=bR6Zjg1Rsoqe4xWLfMAOJ4LfxnIbMO5RLSncYA0sU18=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vobSL6dYkoyCr+D2L2GS1X8zpncLBcAGlkWAVSL6e++m2GjH4M4CeqJotOW/0S2uP
 M0d0ir9EdHSCbQaHXAcVUqIgA7wP/wNwA/MfCxDBuePvBcATRMa0/UtxEGkZ+Efo+Y
 XQeBqsn5JZnTo5v9DhQWJCxMRqL5gZZGasYcN3YY=
Date: Tue, 18 Jan 2022 12:01:01 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Amelie DELAUNAY <amelie.delaunay@foss.st.com>
Message-ID: <Yead7Sjo85S8+hHq@kroah.com>
References: <20211207130101.270314-1-amelie.delaunay@foss.st.com>
 <39694435-d44b-64f8-9614-6082f9c22443@synopsys.com>
 <1f8db483-0965-e87d-20b0-4f2bccd9a3dd@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1f8db483-0965-e87d-20b0-4f2bccd9a3dd@foss.st.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH 1/1] usb: dwc2: gadget: don't try to
 disable ep0 in dwc2_hsotg_suspend
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

On Tue, Jan 18, 2022 at 11:40:46AM +0100, Amelie DELAUNAY wrote:
> Hi Greg,
> 
> Kind reminder about this patch.

It is the middle of the merge window, I can not add any patches to my
tree until 5.17-rc1 is out.

thanks,

greg k-h
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
