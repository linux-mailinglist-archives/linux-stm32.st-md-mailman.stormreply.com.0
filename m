Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8308D2608
	for <lists+linux-stm32@lfdr.de>; Tue, 28 May 2024 22:39:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5831C6B47E;
	Tue, 28 May 2024 20:39:11 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 888E9C640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 May 2024 20:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1716928749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x6EffIoh8MwZvrccS37Mph32R2Ow6o/tLy3glfcjuB8=;
 b=CIqABWOXhlLrquIijJcSmiIE0yXBDf0MCaIMzTsngMd8n7j4j97xMmCvCRCOxtROSEvoSa
 kdBzVJpAb3Z9Gn1wncPL34wPSbVpPATFp1kZeOM13nEUg0j5ZZVhNs2b/i9klKIYx2+iyJ
 pDAV9GACWz9H/M7GlZOdN51WsKNgEGw=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-N96P__QmMFKGZrLl2--XYw-1; Tue, 28 May 2024 16:39:06 -0400
X-MC-Unique: N96P__QmMFKGZrLl2--XYw-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-627e7734a29so18836067b3.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 May 2024 13:39:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716928746; x=1717533546;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x6EffIoh8MwZvrccS37Mph32R2Ow6o/tLy3glfcjuB8=;
 b=RX1ubi3qmC/A6q8D0oEWpVHzzGkGC0I3HiSLBbgJ0ptPDcGe0u4h5jC0s5WT9h1AbM
 BW8wgr7T1mn14dtpYlgIXWDmNdUY62EA8/AWy0AuMhP1B5uclxsQqeCKaBflFmPYktxy
 //aTFfPPJpetE1e0y4geU1wyH65Y+20tLl1y8ASdWvmflhLGFDDDoIAzgwHVkEq9OySp
 JguBz18uQnvVyw9Fx7mtyw12OOLbFkoK2n/TbWUwLrP1/uTYp1LsBjx60uNM3TGOLL4i
 t5HWIlO6cn2v1EZaRyTHsaPlflGmAIPb7Ag6p+YxYZx+NdiWCWep2HJp1wFeZvDKFEm6
 LP4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzoiwGPvI22rVUiHgamXOxFNPuQQYtoiJ87VHprpQcoqPUrFE3rkkfgWxxjlubj31+UPZrV2sJWrh1qrvRQZEK9MuGqySGEtnQzMLIlFeox/9kFZHhdl/4
X-Gm-Message-State: AOJu0YwvNOOcWApVLw1b38z8VUDyTIf17Gkbt+/L2LdwmAN4S5qHk0Pz
 uK9IArNiuVQzoPl5nzSYPg/lHkGa0nrbaprBwOZ0zMnNv/hFa3Kww7CSw5AUFtPqmGLZzmRWk2G
 i5m6dvDPI1kv6Ivbdpbw99tvQBYh/qYNxpm7HPLjJHk1WsaVSHTc/90j04Sr1vErVAPdsIbJAbT
 AOtw==
X-Received: by 2002:a25:dfc2:0:b0:df4:e882:2808 with SMTP id
 3f1490d57ef6-df77225d6eemr12658329276.56.1716928745631; 
 Tue, 28 May 2024 13:39:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFADiGtMB5PHe86EprRX3pmqHddjYCjSB5rShp3UiTh2k95/ADv7AB2qoUulCAwgA2m4mv7xA==
X-Received: by 2002:a25:dfc2:0:b0:df4:e882:2808 with SMTP id
 3f1490d57ef6-df77225d6eemr12658299276.56.1716928745169; 
 Tue, 28 May 2024 13:39:05 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::33])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6ac162ef87fsm47291986d6.80.2024.05.28.13.39.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 13:39:04 -0700 (PDT)
Date: Tue, 28 May 2024 15:39:02 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <omzrnmy3r7nhdhj4ji4m2db7dswhbt5772yft5no5yfjb5i6re@wbqgy36ernsm>
References: <ZlXEgl7tgdWMNvoB@shell.armlinux.org.uk>
 <E1sBvJq-00EHyW-TO@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
In-Reply-To: <E1sBvJq-00EHyW-TO@rmk-PC.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 2/5] net: stmmac: dwxgmac2:
 remove useless NULL pointer initialisations
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

On Tue, May 28, 2024 at 12:48:42PM GMT, Russell King (Oracle) wrote:
> Remove useless NULL pointer initialisations for "PCS" methods from the
> dwxgmac2 code.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
