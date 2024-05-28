Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 381B88D260E
	for <lists+linux-stm32@lfdr.de>; Tue, 28 May 2024 22:40:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01308C6B47E;
	Tue, 28 May 2024 20:40:43 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11EBCC640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 May 2024 20:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1716928835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Yza5SyI0JcR/p8dmMKdorJ+VfFJ4YAQqKl442JnCtPg=;
 b=WCtRTRShq/77TzR/GCZLgCA2IPcd+1mmYYL/t+qrE+8qNiPHYAzo/a6S5hsrjjAKq5SONF
 4KK9CBQ1CNVj5q3Pe4Fkyqkb8vCvG+RsAx9omOeTIMBB8wtdYk8+mkicamNGhU1SKc66ZT
 qEmrYcSaCL+D2M37Il/C0hy6PJbCu48=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-tH-S9SLBObqjMAWnp3iGig-1; Tue, 28 May 2024 16:40:31 -0400
X-MC-Unique: tH-S9SLBObqjMAWnp3iGig-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6ad7afb37dcso11937016d6.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 May 2024 13:40:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716928831; x=1717533631;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yza5SyI0JcR/p8dmMKdorJ+VfFJ4YAQqKl442JnCtPg=;
 b=DX55Af64DCwI61cjOMp6kg7P3iIubHz9JYvKazbNjw2AqwmwdME/jRmWgWZIMH/byw
 5eufhU9DyzH7x78E4ALQBvQ6sh2a4WejdBcbrt0EXdQoj4ym4doHSLSm3R3lKmvDQ52e
 TVW4VkGaFfv0VH63BB8Q1rlNLddb/0cEUWEclreBvkCTKLDOZPr1nY8XkYciOEeBF3U7
 rWl8xnyPdj/BRg41EPT3id724V8dK40Vy+M/TI5itHUDVsNL3vGKUKa9XLowJq+SkIPW
 tV/RXPEQ9nd+fUhz4XBV88VWCggP+ZtLry8Ll82rzqdIGtM5UVRSZC8DdbqQcl+O+HgP
 lnew==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqfxzvyB2T7/7HNR053OqVnNHKBapKkLBLQHKD8gNbaesl2gf8RhsE3Xk9InEC5EDD+g9Ne+jQe6mlKxB0vbF+yqy7DwISipONFFKb44i4h75fEKE5KNbV
X-Gm-Message-State: AOJu0Yxly4zlT5Z1cHga07pb6k0dxw+gfV9BN4n0jzrdFjSzGthN3ljk
 IfEueR/41DhOh/QLE6aJM96JDP5/hJMGUNeM6/1PlBIA/d/S/wa30sTni3hJyUrSjLS3GThKFBe
 3qeHSQgfBzuzEzfYSfDZ6UXRVmyRxQJl3CSwNYpUEhj8sG4gcJLqA0MHyTk6VrQPuvGHo5abPGI
 LhKw==
X-Received: by 2002:a05:6214:448c:b0:6ad:6edb:117e with SMTP id
 6a1803df08f44-6ad6edb11bfmr104427626d6.12.1716928831087; 
 Tue, 28 May 2024 13:40:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzoWdZfNI8wbyhQKj1g5pxOdHs/HarNkz6GuK6rmnxVca+HbJtoShkbsmQe8qICoUxeM40SA==
X-Received: by 2002:a05:6214:448c:b0:6ad:6edb:117e with SMTP id
 6a1803df08f44-6ad6edb11bfmr104427476d6.12.1716928830711; 
 Tue, 28 May 2024 13:40:30 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::33])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6ad83d33667sm20394086d6.107.2024.05.28.13.40.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 13:40:30 -0700 (PDT)
Date: Tue, 28 May 2024 15:40:28 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <uvmwew5cusmghnnm3hc4gnrf4rfdbcliujuo2qwwewcwzlqs4x@fjybiwwljr4b>
References: <ZlXEgl7tgdWMNvoB@shell.armlinux.org.uk>
 <E1sBvJw-00EHyc-0Z@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
In-Reply-To: <E1sBvJw-00EHyc-0Z@rmk-PC.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 3/5] net: stmmac: remove
	pcs_rane() method
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

On Tue, May 28, 2024 at 12:48:48PM GMT, Russell King (Oracle) wrote:
> The pcs_rane() method is not called, so lets just remove this
> redundant code.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
