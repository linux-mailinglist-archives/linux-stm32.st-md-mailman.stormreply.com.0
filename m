Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A6A473D4A
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Dec 2021 07:43:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12C90C5EC76;
	Tue, 14 Dec 2021 06:43:14 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3DCDDC5E2AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Dec 2021 06:43:12 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id z5so60241953edd.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Dec 2021 22:43:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mES/VN9NDUylN7hikeYFALLjEFWfcxTzSl0FnDEQ4qo=;
 b=409rUEX6wazBLoZXHZQeuiU4ead83Ri5mlnBQ3SZRd/lvNcpZpwAKBHt+a4wDWGaxZ
 Oa0IHz5h/9tPC0C2ueJ3DUaTdG6gxrAHVVzvfBf3bOv0iBVVnI9JXp//Nxg1UgIx7stC
 3rJBSsbeivBKSuQulb/EVMMQXIEiwW5cZzJ18rISj0cg9DpH0hpzQTtfDTFSHstMJirM
 PwyadAISsdHhORCVjShQksSKhTSOXtZN6HHrOFZjpvsfYB0qckA0W5jfriSwYe6YhO0k
 YfwD6m8yp4yQllhplDvhj1EYj0BcXT3hFN0mpazKxOy5FBkAAnkDuQVx1cflPAhkD1+n
 oESw==
X-Gm-Message-State: AOAM533/Mrd3ijbD3igB0zYxemTvP/37hMTab/mFkD5/rNNcn1xYrPfM
 6VYJ0kI+eFsI3WX1CAu9HHM=
X-Google-Smtp-Source: ABdhPJwoeQCTf8Mof4FF699wk5L77oT25Ghoc8KhHQrzUkQstWBRt8nQILINgn+e7vIb09ikundH8Q==
X-Received: by 2002:a17:906:c08:: with SMTP id
 s8mr3626628ejf.673.1639464191777; 
 Mon, 13 Dec 2021 22:43:11 -0800 (PST)
Received: from [192.168.1.49] (185-219-167-24-static.vivo.cz. [185.219.167.24])
 by smtp.gmail.com with ESMTPSA id e19sm7251549edu.47.2021.12.13.22.43.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 22:43:11 -0800 (PST)
Message-ID: <8bbd1a77-5f88-bb97-db88-6842df2e3e3c@kernel.org>
Date: Tue, 14 Dec 2021 07:43:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20211213195346.12894-1-arnaud.pouliquen@foss.st.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20211213195346.12894-1-arnaud.pouliquen@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [PATCH] tty: rpmsg: Fix race condition releasing
	tty port
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

On 13. 12. 21, 20:53, Arnaud Pouliquen wrote:
> In current implementation the tty_port struct is part of the
> rpmsg_tty_port structure.The issue is that the rpmsg_tty_port structure is
> freed on rpmsg_tty_remove but also referenced in the tty_struct.
> Its release is not predictable due to workqueues.
> 
> For instance following ftrace shows that rpmsg_tty_close is called after
> rpmsg_tty_release_cport:
> 
>       nr_test.sh-389     [000] .....   212.093752: rpmsg_tty_remove <-rpmsg_dev_
> remove
>               cat-1191    [001] .....   212.095697: tty_release <-__fput
>        nr_test.sh-389     [000] .....   212.099166: rpmsg_tty_release_cport <-rpm
> sg_tty_remove
>               cat-1191    [001] .....   212.115352: rpmsg_tty_close <-tty_release
>               cat-1191    [001] .....   212.115371: release_tty <-tty_release_str
> 
> As consequence, the port must be free only when user has released the TTY
> interface.
> 
> This path (inspired from vcc.c):
> - moves the management of the port in the install and clean-up tty ops,
> - allocates the tty_port struct independently of the rpmsg_tty_port structure,

This looks rather wrong. Why not to use tty_port refcounting?

> - uses tty_vhangup and tty_port_hangup.

OK, but don't store a tty pointer as it looks racy. You should use 
tty_port_tty_get instead.

Hm, we look we need tty_port_tty_vhangup (aside from 
tty_port_tty_hangup). There are plenty of drivers doing:
     tty = tty_port_tty_get(port);
     if (tty) {
             tty_vhangup(port->tty);
             tty_kref_put(tty);


> Fixes: 7c0408d80579 ("tty: add rpmsg driver")
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>

thanks,
-- 
js
suse labs
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
