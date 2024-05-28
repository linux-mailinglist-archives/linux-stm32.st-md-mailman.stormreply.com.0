Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8EA8D2611
	for <lists+linux-stm32@lfdr.de>; Tue, 28 May 2024 22:41:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11EF8C6B47E;
	Tue, 28 May 2024 20:41:17 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E297EC640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 May 2024 20:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1716928875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bHLLFApeJ4V8SU4kObKYGKIEC4OL/obNTMhTcS6bvI0=;
 b=b5JlgNfOiRfeFcO72BT9YOntk91tMtRrBLGss3FQeQ2cocAue5+9AXnKkYfk68I2xZ3yF+
 PPTdZ5wz3hpweQ4QgcuvZizULv1c/Y4PVqVK2RTe7CvSuEJxd4iX1XJG0MFMUheFgRujdg
 OFPVTD9GpR0cOdAJ2RqdpNNqx/pP0cc=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-253-IKKKl5iNPvOT6ATCbRIpMg-1; Tue, 28 May 2024 16:41:13 -0400
X-MC-Unique: IKKKl5iNPvOT6ATCbRIpMg-1
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-43fcc9b4a5cso14890141cf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 May 2024 13:41:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716928873; x=1717533673;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bHLLFApeJ4V8SU4kObKYGKIEC4OL/obNTMhTcS6bvI0=;
 b=Edkno1Rvb6aCcEfWRDHz8cf9iCD6NZgis5XlGbwtlyxlyik+3lZ3KhtYwsArUG8kA7
 s7PF6P/gFeJOFgPtsGVuzUFOTlcoen2qnFddQt+wEMwTJWUQ4U9sRnuOx7rpTnZdxuAP
 FnK4aJCSf+PmVwCzs+bTw61QttN0jRqMIWvLgyz21xMh02r9uFUEI7ebwcC/Bq3mdpVi
 m4Lvflh8B85h3jRzMoIxPfJ9xHyIKX0tA6t+Dns1NW7HdJN1om5BltkIQCrdc9r19BSy
 C8hg/tVhkHvTEzDvujm5VewlTRKxpxtu7j+iRCXdJ0u33xWGmWK5SC4Nwt3MeLo3EqP0
 fHfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYcEWGKJKKTdHWKo/wHdT3n/Y7MzTVMKNa4TZhM4AxQtWhB7mkKBC/B7g0d89qdO3hnL2jmgTbmhNMAiLJlaySzGtGoRpMZAFbkAVlGEGvBOp9fnBVA6w4
X-Gm-Message-State: AOJu0Yw/TpC77T7eFKtLBorpsJEZQtsdNSzawsKv/J5Zqb1EbNsPCXBs
 +hJZjq0ywcEwAr0S9kNVrhG8MYOD0rsIzN3fy9U6zRzjsWxFuCl881ybueY1P+9UfMJnjIfZ3gP
 VhEl7ixXyzZfF/1JHqtWKt43HZgIuKS1v08fbFQu8ge7IHRGMLy1JDnr+t0gBart01kkWaAHjNU
 6BfA==
X-Received: by 2002:ac8:7d42:0:b0:439:577d:9a93 with SMTP id
 d75a77b69052e-43fb0e8729emr125869281cf.20.1716928872609; 
 Tue, 28 May 2024 13:41:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6YXrNajDUDbr7l5g13YizJiMN8IyJIYZyrLmGPUOL2k7RP9GlB7OmQyyHIEERpa012+7G7A==
X-Received: by 2002:ac8:7d42:0:b0:439:577d:9a93 with SMTP id
 d75a77b69052e-43fb0e8729emr125869041cf.20.1716928872060; 
 Tue, 28 May 2024 13:41:12 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::33])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43fb17f3bfasm45738051cf.37.2024.05.28.13.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 13:41:11 -0700 (PDT)
Date: Tue, 28 May 2024 15:41:09 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <z7rcnzmmk44fjn3bnh3mrtub4r62keliwjutvyydjjcn6qp26g@bsuz6hj36ok7>
References: <ZlXEgl7tgdWMNvoB@shell.armlinux.org.uk>
 <E1sBvK1-00EHyi-4l@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
In-Reply-To: <E1sBvK1-00EHyi-4l@rmk-PC.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 4/5] net: stmmac: remove
 unnecessary netif_carrier_off()
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

On Tue, May 28, 2024 at 12:48:53PM GMT, Russell King (Oracle) wrote:
> It is incorrect to call netif_carrier_off(), or in fact any driver
> teardown, before unregister_netdev() has been called.
> 
> unregister_netdev() unpublishes the network device from userspace, and
> takes the interface down if it was up prior to returning. Therefore,
> once the call has returned, we are guaranteed that .ndo_stop() will
> have been called for an interface that was up. Phylink will take the
> carrier down via phylink_stop(), making any manipulation of the carrier
> in the remove path unnecessary.
> 
> In the stmmac_release() path, the netif_carrier_off() call follows the
> call to phylink_stop(), so this call is redundant.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
