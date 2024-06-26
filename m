Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFDC918E78
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jun 2024 20:29:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8AB01C6A613;
	Wed, 26 Jun 2024 18:29:03 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E7CD4C5E2CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jun 2024 18:28:55 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-52ce674da85so3974673e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jun 2024 11:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719426535; x=1720031335;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=llV5RmcUgj5BZ1LNtC4Xqg2HQ2Qk2/PW4RR/EDhyLcM=;
 b=DU0h6++rFJwSttwygxxi77FS48shL4jDM4V+mRJQZu3tytwPiiBTy6+U0tJ1vf/b05
 YonnkRF+oIbkH6ZoSy/Bja+Jq32YqpN4riA0trYe3UEFLgGPWIAgyWyq4yHTY0Zi2LAf
 aHanKB82yGlL0NUT8o1Us659C+aqti8BIESeR9aIg/0SwkW2CfCRRlkSPzuEg92/y/mv
 uvgYBrl9JIE9LVT8QikJqizy1VQHVIxbYyG0VAdlC6SdQ0V4IvHPTfSorzdIQAEUbo3G
 K3oFZexGyhHTgkswP72I0BkLMi/RBDfyWve5rFA1eW+c3HtiE88RdU6G1s+Rg9ZbKU4a
 3E4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719426535; x=1720031335;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=llV5RmcUgj5BZ1LNtC4Xqg2HQ2Qk2/PW4RR/EDhyLcM=;
 b=WeWM6S4zaC5Y5RrA9J179gh84vCYttWw2CUzCTBjnoQsjjXcKA1gUgFQqZuDll9YqD
 AZv8Pl0koNqSpO9+RXHs971Gq+BxoylMPBTw1HlFlnrSL6w+swgwm48EYQEbunRLnWnP
 xXWXqF2w0km3FJD3tk/YwgFxJJzcTkKqvDszmaTxdaRLwLkfe+ErwNzSLIJ4J3uWKAd3
 W6a1ySdnlHZlBS4+VwOSGqae4BZoIp0ylxdxihdig/XgK8wZGkc5MIBuiKRjuxvnzGus
 picJXGGORD92ekhR4fXI0K5aHbTZ2QxT+eDUpQOsuX9BXmvdo4tDb+pisFSKwch+w90c
 NwYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpizYvU5CiiaSX/fSINsYw6Xu+Ic+Iv/5gH+Xpanc3MN028bdfhl7s7AeIs37JvTIImN4yLZlui6fPmx+b+1uOXKdheCcrN4dm26YVbc2DT7MeY2tewsg3
X-Gm-Message-State: AOJu0YxUxP6eRKTBapZO47uRZz7VRxh5GjeAJewBTQq0Pr35c8SAkhDh
 Y3K99cLsURqDTh2BYDNzqx5Rblt+U3c3DhuHMiBJ26P6fH3SnzRxSR624KreSHA=
X-Google-Smtp-Source: AGHT+IFbP34C6diNqJLLb3MTQo9AnJsVc+x8hC7VON+KEozVXfyLzLz94epjeKUeENRIlr8qwKg6eA==
X-Received: by 2002:ac2:4c86:0:b0:52c:d27b:ddcb with SMTP id
 2adb3069b0e04-52ce183270emr8553919e87.3.1719426535066; 
 Wed, 26 Jun 2024 11:28:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cdc4ad815sm1491621e87.306.2024.06.26.11.28.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 11:28:54 -0700 (PDT)
Date: Wed, 26 Jun 2024 21:28:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Message-ID: <2gbvt24uete2mg32eq66rksfjb5gehazwfszoceowejmskxmb6@jv2k74clpiwa>
References: <20240625-ucsi-rework-interface-v3-0-7a6c8e17be3a@linaro.org>
 <ZnwkloBH6UVzPOjg@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZnwkloBH6UVzPOjg@kuha.fi.intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Nikita Travkin <nikita@trvn.ru>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 0/7] usb: typec: ucsi: rework glue
	driver interface
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

On Wed, Jun 26, 2024 at 05:24:22PM GMT, Heikki Krogerus wrote:
> On Tue, Jun 25, 2024 at 05:54:25PM +0300, Dmitry Baryshkov wrote:
> > The interface between UCSI and the glue driver is very low-level. It
> > allows reading the UCSI data from any offset (but in reality the UCSI
> > driver reads only VERSION, CCI an MESSAGE_IN data). All event handling
> > is to be done by the glue driver (which already resulted in several
> > similar-but-slightly different implementations). It leaves no place to
> > optimize the write-read-read sequence for the command execution (which
> > might be beneficial for some of the drivers), etc.
> > 
> > The patchseries attempts to restructure the UCSI glue driver interface
> > in order to provide sensible operations instead of a low-level read /
> > write calls.
> > 
> > If this approach is found to be acceptable, I plan to further rework the
> > command interface, moving reading CCI and MESSAGE_IN to the common
> > control code, which should simplify driver's implementation and remove
> > necessity to split quirks between sync_control and read_message_in e.g.
> > as implemented in the ucsi_ccg.c.
> > 
> > Note, the series was tested only on the ucsi_glink platforms. Further
> > testing is appreciated.
> 
> I tested these on couple of systems that use the acpi mailbox, and
> didn't see any problems. I'll be away for most of July, so if there's
> nothing else, for the series:
> 
> Tested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 

Thanks!

-- 
With best wishes
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
