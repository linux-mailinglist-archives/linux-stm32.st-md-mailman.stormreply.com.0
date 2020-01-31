Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6083E14E977
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Jan 2020 09:15:29 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23A99C36B0C;
	Fri, 31 Jan 2020 08:15:29 +0000 (UTC)
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6A60CC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jan 2020 08:15:27 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id 4so3044973pgd.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jan 2020 00:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0Y/URflAN0egTNKiFFMYLQYMJ9wMyROzssZLeoHgDcA=;
 b=bDvPIqs7zk+6Ua13LmwPSUxJHYoP3sz8dXzrXUCY11vG2q89ymnvF9KOeRMwUirtgO
 WhyUtcVQPAnzhKrKITFqvSYkxlT9ISAcAWsYUN+KrpW0FCHyu+ZluN9d0tj4O4L669Xl
 2lPXBX7A9ppfx8G8cJPmJPdkjkLVNJvFVuhlBD9SJleQXfC/Tqo5TZuncxblMoLotnGK
 Ib83dfWkfHcjCYYEuWSvqtZNns38l/X/5LdjmvUkkdqJjDw/KKgoqrjFMG2JYHJbJtGo
 Hwmntfvq8q/lf8F4I/zJ0W6jIKekE15B6f/Dz4JvKJXfdrWECkV2PUL2Ir7vthKG/b/Q
 h+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0Y/URflAN0egTNKiFFMYLQYMJ9wMyROzssZLeoHgDcA=;
 b=JK1cxnWJ5XdUjtMCuPpwYoy4hcdX/3++UoGlDxCY1l2vY37IjencRQdZ0TnUvCbJKB
 v3m3LcRMiY/BR8gC06qz3fsz144eJXN8glvPE4ssazO/5D7fRvuyseyGa4uJ+FRqzQfo
 Eg+arJm8p79JP3X5oaB+RaMWzM5cPJYn+Rrgk07nmJEjuOpFrRnIRjeltq28gdD5/Pye
 EizEcnJanW+I6P0Ux9nPvpNbDnDkqJ3B+HNs31ihJrNtwKxS3nvW4O2tyBoMUPl1h1iX
 9jiffa2vEBkTaiGDEeXMUlK4qzqPegIlBwdL3VECxEKhFxfPLH1eFlMHXChvhh0MBgMa
 TYIg==
X-Gm-Message-State: APjAAAWS4k8fjM7arfIptVEBdEsgTlOmVb346NzZaMeiNICUWDjaGjEY
 mZClt5zYAIYsX1QamOyGJa03UW/Yg2OAzyI8hj8=
X-Google-Smtp-Source: APXvYqwboAwjQDtVTg7bEoGRHsUXs8ZLkrvGg15+8RVjrgNqc260m2Rt7Sk+vi/Git2Gv4dOVb64A1UzzyTlsxidGbE=
X-Received: by 2002:a65:4685:: with SMTP id h5mr9486059pgr.203.1580458525958; 
 Fri, 31 Jan 2020 00:15:25 -0800 (PST)
MIME-Version: 1.0
References: <20200131045953.wbj66jkvijnmf5s2@kili.mountain>
In-Reply-To: <20200131045953.wbj66jkvijnmf5s2@kili.mountain>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 31 Jan 2020 10:15:14 +0200
Message-ID: <CAHp75Vc7eudHy=05nHKB2==QJM1f23E1jZw=7yFKHA1nq0qBqA@mail.gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Ajay Gupta <ajayg@nvidia.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 kernel-janitors@vger.kernel.org,
 Iyappan Subramanian <iyappan@os.amperecomputing.com>,
 Quan Nguyen <quan@os.amperecomputing.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Steve Glendinning <steve.glendinning@shawell.net>,
 Keyur Chudgar <keyur@os.amperecomputing.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, netdev <netdev@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net] device property: change
 device_get_phy_mode() to prevent signedess bugs
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

On Fri, Jan 31, 2020 at 7:03 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The device_get_phy_mode() was returning negative error codes on
> failure and positive phy_interface_t values on success.  The problem is
> that the phy_interface_t type is an enum which GCC treats as unsigned.
> This lead to recurring signedness bugs where we check "if (phy_mode < 0)"
> and "phy_mode" is unsigned.
>
> In the commit 0c65b2b90d13 ("net: of_get_phy_mode: Change API to solve
> int/unit warnings") we updated of_get_phy_mode() take a pointer to
> phy_mode and only return zero on success and negatives on failure.  This
> patch does the same thing for device_get_phy_mode().  Plus it's just
> nice for the API to be the same in both places.


> +       err = device_get_phy_mode(dev, &config->phy_interface);

> +       if (err)
> +               config->phy_interface = PHY_INTERFACE_MODE_NA;

Do you need these? It seems the default settings when error appears.

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
