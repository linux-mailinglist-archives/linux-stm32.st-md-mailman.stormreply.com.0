Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E1712EAA7
	for <lists+linux-stm32@lfdr.de>; Thu,  2 Jan 2020 20:53:19 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5EE83C36B0B;
	Thu,  2 Jan 2020 19:53:19 +0000 (UTC)
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 110D3C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jan 2020 19:53:18 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id r67so3678048pjb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 Jan 2020 11:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=nNE7nxiMOHhNQ2zWJXigqMAR0pKRSawVm+iGS8N5/rk=;
 b=OGi5G4e0MGP5zSP7OHdg0uZJ+Yg1uGgbvrWTDBCiSvXn4IjvXPBs+0p4HBQrMYFJ9p
 6QAfy1sZbtxDKZXmOO/R4xkdzb+rHkKUDMLV1h0VoiU89v+V3JUDxVsnn896dturiyrg
 KJeWFgQ7BYoUVm6OLSUapiwVsHG6d7Cl0igPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nNE7nxiMOHhNQ2zWJXigqMAR0pKRSawVm+iGS8N5/rk=;
 b=AnN6iizFlQDt1QG4FCNsImiRpgy7co37f4vKvgQP+YsoUIPPOIlZTgzNPUkRTvIVjD
 CoD79GGjBEDr8LIseYqdoTeNdSHlvg4JUCBXj50k3jZ8Rw6a3CcWJQUvxtog4byC+FXN
 HNdtkNcNhWgcffK8zvYL5Z3UUVw9KxkdscF0HizIiiiWN5RQS7LZ23pApEFB8/8Z9iN+
 sBfXbr9a2YDPv4Acaoxt7WrooVXbvFV2SaEVkoscNU+JQr3imR4ShXNPjAdBFSxa5AMs
 /U8xUYvv1XK5TcOcbcH0/h0PFIZKq+hm5semgrXwxoA5fD2NDOiPbHEL5HR3dq96ZVv4
 h6kg==
X-Gm-Message-State: APjAAAUjWSYUrm05veblGR/ZaMurTRf2k3+g9FmxvySU+CsQZGW+c395
 YrvSMS9Ei9bSZnBGA/K6/Nrqdg==
X-Google-Smtp-Source: APXvYqy/R+36CiqUMUAf+/qlTm7lPsQwgVHBfcUlFHRAAY+sRLqjXug+95ypeJnMlNd+If7cQ8egVA==
X-Received: by 2002:a17:90a:f84:: with SMTP id 4mr22094454pjz.74.1577994796375; 
 Thu, 02 Jan 2020 11:53:16 -0800 (PST)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
 by smtp.gmail.com with ESMTPSA id z13sm12100871pjz.15.2020.01.02.11.53.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2020 11:53:15 -0800 (PST)
Date: Thu, 2 Jan 2020 14:53:14 -0500
From: Joel Fernandes <joel@joelfernandes.org>
To: Steven Rostedt <rostedt@goodmis.org>
Message-ID: <20200102195314.GA227154@google.com>
References: <20191127154428.191095-1-antonio.borneo@st.com>
 <20191204092115.30ef75c9@gandalf.local.home>
 <20191221234741.GA116648@google.com>
 <20191223151301.20be63f7@gandalf.local.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191223151301.20be63f7@gandalf.local.home>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] tracing: Fix printing ptrs in preempt/irq
 enable/disable events
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

On Mon, Dec 23, 2019 at 03:13:01PM -0500, Steven Rostedt wrote:
> On Sat, 21 Dec 2019 18:47:41 -0500
> Joel Fernandes <joel@joelfernandes.org> wrote:
> 
> > On Wed, Dec 04, 2019 at 09:21:15AM -0500, Steven Rostedt wrote:
> > > 
> > > Joel,
> > > 
> > > Any comments on this patch?  
> > 
> > Steve, it looks like this issue happens with trace-cmd not knowing what
> > _stext is. If I do cat trace_pipe , then I don't see the issue as _stext is
> > looked up correctly but the reporter of the bug is using trace-cmd. Is there
> > a way to solve this within trace-cmd? Not knowing much about trace-cmd
> > internals, I will have to defer to you on this though..
> > 
> > Other than this, I need to make the offset to _stext as s32 instead of u32
> > type so that the problem of the symbol location being before _stext does not
> > cause overflow.
> > 
> > Lastly, I am not super convinced that we need to store the full pointer just
> > to handle a case where the offset of the symbol might be more than +-2G from
> > _stext. Once we see such issue, then we can handle it. But right now the size
> > of the trace buffer is utilized better by just storing the offset IMHO.
> >
> 
> Does this fix it for you?

I am guessing this question is for Antonio to try Steve's patch with trace-cmd.
Meanwhile I posted a patch to fix the offset issue by changing the u32 to s32.

thanks,

 - Joel

> 
> -- Steve
> 
> diff --git a/lib/traceevent/event-parse.c b/lib/traceevent/event-parse.c
> index 4fd3907e..dc705dd2 100644
> --- a/lib/traceevent/event-parse.c
> +++ b/lib/traceevent/event-parse.c
> @@ -3595,6 +3595,45 @@ tep_find_event_by_name(struct tep_handle *tep,
>  	return event;
>  }
>  
> +static unsigned long long test_for_symbol(struct tep_handle *tep,
> +					  struct tep_print_arg *arg)
> +{
> +	unsigned long long val = 0;
> +	struct func_list *item = tep->funclist;
> +	char *func;
> +	int i;
> +
> +	if (isdigit(arg->atom.atom[0]))
> +		return 0;
> +
> +	for (i = 0; i < (int)tep->func_count; i++) {
> +		unsigned long long addr;
> +		const char *name;
> +
> +		if (tep->func_map) {
> +			addr = tep->func_map[i].addr;
> +			name = tep->func_map[i].func;
> +		} else if (item) {
> +			addr = item->addr;
> +			name = item->func;
> +			item = item->next;
> +		} else
> +			break;
> +
> +		if (strcmp(arg->atom.atom, name) == 0) {
> +			val = addr;
> +			break;
> +		}
> +	}
> +
> +	func = realloc(arg->atom.atom, 32);
> +	if (func) {
> +		snprintf(func, 32, "%lld", val);
> +		arg->atom.atom = func;
> +	}
> +	return val;
> +}
> +
>  static unsigned long long
>  eval_num_arg(void *data, int size, struct tep_event *event, struct tep_print_arg *arg)
>  {
> @@ -3611,7 +3650,10 @@ eval_num_arg(void *data, int size, struct tep_event *event, struct tep_print_arg
>  		/* ?? */
>  		return 0;
>  	case TEP_PRINT_ATOM:
> -		return strtoull(arg->atom.atom, NULL, 0);
> +		val = strtoull(arg->atom.atom, NULL, 0);
> +		if (!val)
> +			val = test_for_symbol(tep, arg);
> +		return val;
>  	case TEP_PRINT_FIELD:
>  		if (!arg->field.field) {
>  			arg->field.field = tep_find_any_field(event, arg->field.name);
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
