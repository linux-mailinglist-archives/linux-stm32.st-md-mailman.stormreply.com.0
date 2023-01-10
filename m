Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B7D663E2A
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Jan 2023 11:27:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 94443C6904A;
	Tue, 10 Jan 2023 10:27:56 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A154C65048
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Jan 2023 10:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673346474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9KIby0sHbh660F6W00pOyfjQiD0YxkgesI7WCpTcF84=;
 b=EAL0Rq/UAEVualdmxWIfF+UqbDhyA3COr9Hu9J6aRZE5ZYe0fjeKwjKh6EwoYCtZ8hdylg
 xCeQMKA1gl3QIiS9r5l9KMTTZzjfX25tDjJ5bRotQ1ROJO4hWK3q949mKPdH2JRLE8QqE/
 P5n5dPp308vLWKq0hSIjQWL/1Qdovto=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-99-OA6VLCS5P_W2-gTkMQF4Ow-1; Tue, 10 Jan 2023 05:27:52 -0500
X-MC-Unique: OA6VLCS5P_W2-gTkMQF4Ow-1
Received: by mail-qk1-f200.google.com with SMTP id
 u11-20020a05620a430b00b007052a66d201so8499510qko.23
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Jan 2023 02:27:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9KIby0sHbh660F6W00pOyfjQiD0YxkgesI7WCpTcF84=;
 b=wQvH8xdbQNW2IBubcRMapFNT6Lyyv1ti8IGBnbBYgv4tSbAch8Y0v6kAgbTPZg3WS1
 mnCCzthkOSFwdszqPl2MKuK+98nMsgH0nsnFvH3BYQ1L7Rkz5R4MRh3ivoKQvcAKUMBm
 G/M2nfGla3HJHSQesaYVY91qgRxR0Kcext01l20niiQIdHLamUxh2SPToLB3vsv1Z7YT
 LPfkTr3SgzGCD2fvE4s6x22lZJIOiHWnF3nZE5BHHvXkjvovDBs8pJLrQ9H8hqY9beBl
 u6XcaEDQHsLfMcnKnbSFfynaEs139owfl8ri7JNhr+iJD956SMNj6l5HY0v+XEi/Ygy7
 ID+w==
X-Gm-Message-State: AFqh2krSM2/UgguFdzM/87kdcrQxZ4chhJ4surkwn15Lkx7yMpd2f0C7
 LP9yRenjIVtvZovOKeB18R0AZ0OwUnb5IHNf4gu3BPvJBx7RcfDwhUbNOcCLbUbkR6Mkudp/wXe
 ZpOBEqOdFJonVb8wkD982H1PA5pdBIfjnK8s6hYPo
X-Received: by 2002:ac8:546:0:b0:3a9:9218:e110 with SMTP id
 c6-20020ac80546000000b003a99218e110mr96438692qth.37.1673346472291; 
 Tue, 10 Jan 2023 02:27:52 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtNbXuxMZfi5jwcdohKmvDBprOB9kZdOoqzZtAC3vlZswt2hulAE8XHX60Y529sh9eOWOGAVg==
X-Received: by 2002:ac8:546:0:b0:3a9:9218:e110 with SMTP id
 c6-20020ac80546000000b003a99218e110mr96438670qth.37.1673346472039; 
 Tue, 10 Jan 2023 02:27:52 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-120-128.dyn.eolo.it.
 [146.241.120.128]) by smtp.gmail.com with ESMTPSA id
 a19-20020ac81093000000b0039a610a04b1sm5804132qtj.37.2023.01.10.02.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 02:27:51 -0800 (PST)
Message-ID: <b87cdb13baab2a02be2fb3ffc54c581d097cbe7d.camel@redhat.com>
From: Paolo Abeni <pabeni@redhat.com>
To: Noor Azura Ahmad Tarmizi <noor.azura.ahmad.tarmizi@intel.com>, "David S
 . Miller" <davem@davemloft.net>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Richard Cochran <richardcochran@gmail.com>
Date: Tue, 10 Jan 2023 11:27:47 +0100
In-Reply-To: <20230109151546.26247-1-noor.azura.ahmad.tarmizi@intel.com>
References: <20230109151546.26247-1-noor.azura.ahmad.tarmizi@intel.com>
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Noor Azura Ahmad Tarmizi <noor.azura.ahmad.tarmizi@linux.intel.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Looi Hong Aun <hong.aun.looi@intel.com>, Tan Tee Min <tee.min.tan@intel.com>,
 Muhammad Husaini Zulkifli <muhammad.husaini.zulkifli@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: add aux timestamps
 fifo clearance wait
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

On Mon, 2023-01-09 at 23:15 +0800, Noor Azura Ahmad Tarmizi wrote:
> Add timeout polling wait for auxiliary timestamps snapshot FIFO clear bit
> (ATSFC) to clear. This is to ensure no residue fifo value is being read
> erroneously.
> 
> Cc: <stable@vger.kernel.org> # 5.10.x
> Signed-off-by: Noor Azura Ahmad Tarmizi <noor.azura.ahmad.tarmizi@intel.com>

Please post a new revision of this patch including a suitable 'Fixes'
tag, thanks!

Paolo

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
