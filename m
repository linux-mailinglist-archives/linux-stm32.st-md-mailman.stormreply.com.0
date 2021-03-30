Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9885034E856
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Mar 2021 15:05:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26800C57B54;
	Tue, 30 Mar 2021 13:05:08 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5767BC5719D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Mar 2021 13:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617109505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zEabHD/V6iZrPn1MSypSR5kWmST9dAaEpzKcbSfdR40=;
 b=Nz6jvRi/m6fyVpRUeAI1xAHr9HOaZS6SyTFdNZ+Ei3IDetMWxnrU1qFtts68VjiwCjbu39
 gNZ7RS6n76co7IAP+bUNbxEiIcoI0Ifogo2kXORgNHAYIbkpH8Lal3Z+rEAwPz2JZv+7eq
 6T4ANAXWM1j2iAHAHdIMfuSImKxPiCo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-N9TsKufIOluS7OyA4Uc8OQ-1; Tue, 30 Mar 2021 09:05:00 -0400
X-MC-Unique: N9TsKufIOluS7OyA4Uc8OQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17E0A8030A1;
 Tue, 30 Mar 2021 13:04:58 +0000 (UTC)
Received: from carbon (unknown [10.36.110.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C8FE654272;
 Tue, 30 Mar 2021 13:04:49 +0000 (UTC)
Date: Tue, 30 Mar 2021 15:04:48 +0200
From: Jesper Dangaard Brouer <brouer@redhat.com>
To: Ong Boon Leong <boon.leong.ong@intel.com>
Message-ID: <20210330150448.1eae9a6b@carbon>
In-Reply-To: <20210330024949.14010-1-boon.leong.ong@intel.com>
References: <20210330024949.14010-1-boon.leong.ong@intel.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: Song Liu <songliubraving@fb.com>, Martin KaFai Lau <kafai@fb.com>,
 linux-kernel@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Yonghong Song <yhs@fb.com>,
 linux-stm32@st-md-mailman.stormreply.com, brouer@redhat.com,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>, bpf@vger.kernel.org,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, KP Singh <kpsingh@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, netdev@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Jesper Dangaard Brouer <hawk@kernel.org>
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/6] stmmac: Add XDP support
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

On Tue, 30 Mar 2021 10:49:43 +0800
Ong Boon Leong <boon.leong.ong@intel.com> wrote:

> It will be great if community help test out these v2 patch series on your
> platform and provide me feedback.

Are there any (developer) boards available that can be bought online?
(that have HW for this Ethernet driver stmmac)

I'm interested in playing with the hardwares Split Header (SPH)
feature. As this was one of the use-cases for XDP multi-frame work.

-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
