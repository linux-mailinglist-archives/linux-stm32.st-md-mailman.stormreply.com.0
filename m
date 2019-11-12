Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D75F8A67
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Nov 2019 09:20:04 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8C5EC36B11;
	Tue, 12 Nov 2019 08:20:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D576AC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Nov 2019 07:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573542826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+/PslG0x/GuyfOYX/QGY2CmojWWuenPENm2HBUOpPKE=;
 b=RhED8S8/rM3G6cJ52uSeWF8f4lnqaYu0xYFDQZ7VsnroyMHevVw/sctGmtEX00nP6mwpuy
 pYY3CXdXOTUrbeNegrBHPr66ymBq04erQbybal6bsAqd/ONOYAeV6r5f9lf/i5CdK/3SZ0
 44+pL9wpDxyOUtxef1bL4YGAQHex/oo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-H7j87F9JNhiJLtRPckSSlg-1; Tue, 12 Nov 2019 02:13:43 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D764800EB3;
 Tue, 12 Nov 2019 07:13:41 +0000 (UTC)
Received: from localhost (ovpn-112-54.rdu2.redhat.com [10.10.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C188060872;
 Tue, 12 Nov 2019 07:13:38 +0000 (UTC)
Date: Mon, 11 Nov 2019 23:13:37 -0800 (PST)
Message-Id: <20191111.231337.234535765361161267.davem@redhat.com>
To: Jose.Abreu@synopsys.com
From: David Miller <davem@redhat.com>
In-Reply-To: <cover.1573482991.git.Jose.Abreu@synopsys.com>
References: <cover.1573482991.git.Jose.Abreu@synopsys.com>
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: H7j87F9JNhiJLtRPckSSlg-1
X-Mimecast-Spam-Score: 0
X-Mailman-Approved-At: Tue, 12 Nov 2019 08:20:01 +0000
Cc: Joao.Pinto@synopsys.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 0/6] net: stmmac: Improvements
	for -next
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

From: Jose Abreu <Jose.Abreu@synopsys.com>
Date: Mon, 11 Nov 2019 15:42:33 +0100

> Misc improvements for stmmac.
 ...

Series applied.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
