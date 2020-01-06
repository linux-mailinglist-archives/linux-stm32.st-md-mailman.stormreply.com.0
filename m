Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A57131AA8
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Jan 2020 22:46:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ABA3CC36B0B;
	Mon,  6 Jan 2020 21:46:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB57AC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jan 2020 21:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578347170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LNwRHyI2AjpDdbwvKWA3E8D6dUXFXM87APIN8g0WhXQ=;
 b=Ujw9mmvCDe6FQNuEx9s8F9ntY9p1bQ2JLQWS7k8f5mI8hSoRrnHOJ4HwjSJ+IiZYPPCVT3
 cA/sPvxLVNyyYe0ZmWUNBc9uXtVqTbj9wuR1T93hRpEdHklM+mtEiS4cfzAQbiZZkUp0c7
 jzEFw7MqIH9UPWjFCSYMIRkSpuHUq9k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-3Mf2JKw9MZisqS9uRU7tBA-1; Mon, 06 Jan 2020 16:46:06 -0500
X-MC-Unique: 3Mf2JKw9MZisqS9uRU7tBA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90D72801E6C;
 Mon,  6 Jan 2020 21:46:01 +0000 (UTC)
Received: from localhost (ovpn-112-4.rdu2.redhat.com [10.10.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C192160CD1;
 Mon,  6 Jan 2020 21:45:58 +0000 (UTC)
Date: Mon, 06 Jan 2020 13:45:57 -0800 (PST)
Message-Id: <20200106.134557.2214546621758238890.davem@redhat.com>
To: jiping.ma2@windriver.com
From: David Miller <davem@redhat.com>
In-Reply-To: <20200106023341.206459-1-jiping.ma2@windriver.com>
References: <20200106023341.206459-1-jiping.ma2@windriver.com>
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] stmmac: debugfs entry name is not be
 changed when udev rename device name.
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

From: Jiping Ma <jiping.ma2@windriver.com>
Date: Mon, 6 Jan 2020 10:33:41 +0800

> Add one notifier for udev changes net device name.
> 
> Signed-off-by: Jiping Ma <jiping.ma2@windriver.com>

This doesn't apply to 'net' and since this is a bug fix that is where
you should target this change.

Thank you.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
